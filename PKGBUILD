# Maintainer: Cravix < dr dot neemous at gmail dot com >

pkgname=lugaru-mods
pkgver=20130606
pkgrel=1
pkgdesc="Mods of Lugaru, includes Empire, the Seven Tasks and Reluctant Assassin"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.wolfire.com/lugaru/mods"
depends=('lugaruhd-hg')
source=('http://cdn.wolfire.com/legacy/LugaruEmpire.zip'
         'http://cdn.wolfire.com/mods/lugaru/SevenTasks.zip'
         'http://cdn.wolfire.com/mods/lugaru/ReluctantAssassin.zip'
         'http://forums.wolfire.com/download/file.php?id=990')
sha256sums=('679b9e31e51ca555c287c5a0abdd3670b46bfc6c7af766a29f50a5a468f89355'
            '735f70f0bb97ef2d73dc0150c2011d861e479a29c65c8cef997543b971649b23'
            'edbb46be77afe540f554742ccea5ea8840f41b5fa73d05f65692abfe2caba42d'
            'df89c08670f865284c2595bba39e9c000c8161fdc3a46bfc04828b70777378a1')

build() {
	mkdir -p $pkgdir/opt/LugaruHD/Data/
	cd $pkgdir/opt/LugaruHD/Data/
	mkdir Campaigns Maps Textures

	cd $srcdir
	
	#Eyelid.png and Lugaru.png is useless unless you overwrite 
	#those with the same name under /opt/LugaruHD/Data/Textures/
	
	## clean dup
	#rm "Reluctant_Assassin/This Goes In Textures/Belt.png" "Lugaru Empire/This goes into Textures"/{shirtfemale,Gi}.png
	
	# clean all and directly omit ra
	rm "Lugaru Empire/This goes into Textures"/{Eyelid,Lugaru,shirtfemale,Gi}.png

	# Seven Tasks
	mv task18 "the Seven Tasks"
	cd "the Seven Tasks"
	mv task* $pkgdir/opt/LugaruHD/Data/Maps/
	mv main.txt $pkgdir/opt/LugaruHD/Data/Campaigns/"seven tasks.txt"
	cd ..
	
	# Empire
	cd "Lugaru Empire"
	mv "This goes into Maps"/jendraz* $pkgdir/opt/LugaruHD/Data/Maps/
	mv "This goes into Campaigns"/main.txt $pkgdir/opt/LugaruHD/Data/Campaigns/empire.txt
	mkdir $pkgdir/opt/LugaruHD/Data/Textures/empire
	mv "This goes into Textures"/*.png $pkgdir/opt/LugaruHD/Data/Textures/empire/
	cd ..
	
	# Reluctant Assassin
	cd "Reluctant_Assassin"
	mv "This Goes in Campaign"/main.txt $pkgdir/opt/LugaruHD/Data/Campaigns/"reluctant assassin.txt"
	mv "This Goes In Maps"/lotus* $pkgdir/opt/LugaruHD/Data/Maps/
	# only Eyelid.png and Lugaru.png and a dup file Belt.png here
	#mkdir $pkgdir/opt/LugaruHD/Data/Textures/"reluctant assassin"
	#mv "This Goes In Textures"/*.png $pkgdir/opt/LugaruHD/Data/Textures/"reluctant assassin"
	cd ..
	
	#zip or mac produced wrong execute bits?
	chmod -R 644 $pkgdir/opt/LugaruHD/Data/Textures/*
	chmod 755 $pkgdir/opt/LugaruHD/Data/Textures/*
}
