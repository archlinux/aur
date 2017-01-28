# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Bob Finch <w9ya@qrparci.net>

pkgname=tlf
pkgver=1.2.2
pkgrel=1
pkgdesc="a console mode networked logging and contest program for hamradio"
url="https://tlf.github.com/"
license=('GPL')
depends=('hamlib')
makedepends=('autoconf' 'automake' 'pkg-config')
optdepends=('cwdaemon: transmitting cw'
	    'cty: country files'
	    'joe: editing qsos'
	    'xplanet: mapped qso display')
arch=('i686' 'x86_64')
source=(https://github.com/Tlf/tlf/archive/$pkgname-$pkgver.tar.gz
#        http://sharon.esrac.ele.tue.nl/pub/linux/ham/tlf/nrau
        $pkgname.desktop
	$pkgname.png
        $pkgname.1)

build() {
	cd $srcdir/$pkgname-$pkgname-$pkgver

	autoreconf --install
	./configure --prefix=/usr --enable-hamlib
  
	make || return 1
}

package() {
	cd "$srcdir/$pkgname-$pkgname-$pkgver/"

	make prefix=$pkgdir/usr datadir=$pkgdir/usr/share install

#	cp ../nrau $pkgdir/usr/share/$pkgname

	mkdir -p $pkgdir/usr/bin
	mv $pkgdir/usr/bin/$pkgname $pkgdir/usr/bin/$pkgname.1
	install -D -m 755 ../$pkgname.1 $pkgdir/usr/bin/$pkgname

	mkdir -p $pkgdir/usr/share/{applications,pixmaps}
	install -D -m 644 ../$pkgname.png $pkgdir/usr/share/pixmaps
	install -D -m 644 ../$pkgname.desktop $pkgdir/usr/share/applications
}
md5sums=('ce03806349170fac84f6408b5e67f109'
         'b83cca73cea288ed139993efceb245b5'
         'f148583e02660cb430f638fd8f71f452'
         'b706428f41d32bd5f4f6f671057638c0')
sha256sums=('2af47ab875a76aa17805d6c134d5a37d7854b726a5f9d04152e963a25f874976'
            'cc7b5bcf825ea342d126a54a778c4f837ea0da4a12101383f99282041eb5d574'
            '0ddcde4f0dfa98540d4314660108ed49bfa0bc3d8b87cb46906dfd6f12be2497'
            '766253a6f4b1d7e0526366875a46e220d637665c3c44e551f8d3db4ed88aaf81')
