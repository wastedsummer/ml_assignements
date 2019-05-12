function question4()
setosa_data = csvread('trainingSetosa.csv');
versicolor_data = csvread('trainingVersicolor.csv');
virginica_data = csvread('trainingVirginica.csv');

setosa_sl = setosa_data(1:40,1);
setosa_sb = setosa_data(1:40,2);
setosa_pl = setosa_data(1:40,3);
setosa_pb = setosa_data(1:40,4);

versicolor_sl = versicolor_data(1:40,1);
versicolor_sb = versicolor_data(1:40,2);
versicolor_pl = versicolor_data(1:40,3);
versicolor_pb = versicolor_data(1:40,4);

virginica_sl = virginica_data(1:40,1);
virginica_sb = virginica_data(1:40,2);
virginica_pl = virginica_data(1:40,3);
virginica_pb = virginica_data(1:40,4);

% histogram(virginica_pb, 10)

setosa = [];
versicolor = [];
virginica = [];

setosa = [mean(setosa_data); sqrt(var(setosa_data))];
versicolor = [mean(versicolor_data); sqrt(var(versicolor_data))];
virginica = [mean(virginica_data); sqrt(var(virginica_data))];
    
setosa
versicolor
virginica

setosa(1,1:4)

prob_s_s = mvnpdf(setosa_data, setosa(1,1:4), cov(setosa));
prob_ve_s = mvnpdf(versicolor_data, setosa(1,1:4), cov(setosa));
prob_vi_s = mvnpdf(virginica_data, setosa(1,1:4), cov(setosa));

prob_s_ve = mvnpdf(setosa_data, versicolor(1,1:4), cov(versicolor));
prob_ve_ve = mvnpdf(versicolor_data, versicolor(1,1:4), cov(versicolor));
prob_vi_ve = mvnpdf(virginica_data, versicolor(1,1:4), cov(versicolor));

prob_s_vi = mvnpdf(setosa_data, virginica(1,1:4), cov(virginica));
prob_ve_vi = mvnpdf(versicolor_data, virginica(1,1:4), cov(virginica));
prob_vi_vi = mvnpdf(virginica_data, virginica(1,1:4), cov(virginica));

prob_x = (mvnpdf(setosa(1,1:4), cov(setosa)) + mvnpdf(versicolor(1,1:4), cov(versicolor)) + mvnpdf(virginica(1,1:4), cov(virginica)))/3

p_s_s = (prob_s_s * 1/3) / prob_x(setosa_data) 

end