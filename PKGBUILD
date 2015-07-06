# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Bob Finch <w9ya@qrparci.net>

pkgname=tlf
pkgver=1.2.1
pkgrel=2
pkgdesc="a console mode networked logging and contest program for hamradio"
url="https://tlf.github.com/index2.html"
license=('GPL')
depends=('hamlib' 'desktop-file-utils')
optdepends=('cwdaemon: transmitting cw'
	    'cty: country files'
	    'joe: editing qsos'
	    'xplanet: mapped qso display')
arch=('i686' 'x86_64')
install=$pkgname.install
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
md5sums=('14d8e8df085912916ed1ac7803b0c311'
         '48289e3e0a0a20453714ce0f982f56d6'
         'f148583e02660cb430f638fd8f71f452'
         'b706428f41d32bd5f4f6f671057638c0')
sha256sums=('dace18abdf93d754acc47a97bef9accc5422348e92aa654a2684abaa07bc5425'
            '213f636ac5fbfc1e6eaa5f2ca9665514b51faa2879a0635fe075227d4de83ed1'
            '0ddcde4f0dfa98540d4314660108ed49bfa0bc3d8b87cb46906dfd6f12be2497'
            '766253a6f4b1d7e0526366875a46e220d637665c3c44e551f8d3db4ed88aaf81')
