# Contributor: Eric Forgeot < http://anamnese.online.fr >
# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>

pkgname=goattracker
pkgver=2.72
pkgrel=1
pkgdesc="GoatTracker is a crossplatform C64 music tracker. Included in this package are also the tools betaconv ins2snd2  mod2sng  sngspli2"
arch=('i686' 'x86_64')
url="http://covertbitops.c64.org/"
license=('GPL')
#makedepends=('sdl')
depends=('sdl')

source=('http://cadaver.homeftp.net/tools/goattrk2.zip')

md5sums=('5f4b330cf74aa7293286165eac6315c7')


build() {
	cd $startdir/src/src
	sed -i -e "s/datafile/bme\/datafile/g" $startdir/src/src/makefile.common
	sed -i -e "s/dat2inc/bme\/dat2inc/g" $startdir/src/src/makefile.common
	#./configure --prefix=/usr/src
	cd bme
	make
	cd ..
	make
	mkdir -p $startdir/pkg/usr/bin
	mkdir -p $startdir/pkg/usr/share/goattraker
	
	cp -fr $startdir/src/linux/* $startdir/pkg/usr/bin
	rm -fr $startdir/pkg/usr/bin/goattrk2.exe
	cp -fr $startdir/src/goat_tracker_commands.pdf $startdir/pkg/usr/share/goattraker/
	cp -fr $startdir/src/examples $startdir/pkg/usr/share/goattraker/
	cp -fr $startdir/src/readme.txt $startdir/pkg/usr/share/goattraker/
	cp -fr $startdir/src/readme.txt $startdir/pkg/usr/share/goattraker/

	ln -s /usr/bin/goattrk2 $startdir/pkg/usr/bin/goattracker
	
	#desktop icons
	mkdir -p $pkgdir/usr/share/pixmaps
	cp $srcdir/../goattracker.png $pkgdir/usr/share/pixmaps/goattracker.png
	
	install -D -m644 $srcdir/../goattracker.desktop $pkgdir/usr/share/applications/goattracker.desktop

	
	echo -e "\n betaconv  goattrk2  ins2snd2  mod2sng  sngspli2 are installed in /usr/bin \n"

	
}
