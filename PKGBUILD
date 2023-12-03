# Maintainer: not_anonymous <nmlibertarian@gmail.com>

# Previous Maintainer: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
# Contributor: Ruslan Nabioullin <rnabioullin at gmail dot com>
# Contributor: WB2FKO <mph at sportscliche dot com>
# Contributor: Gordon JC Pearce <gordon at gjcp dot net>
# Original Contributor: Bob Finch <w9ya at qrparci dot net>

pkgname=xastir
pkgver=2.2.0
pkgrel=1
pkgdesc="HAM RADIO - Full featured APRS Tracking/Information Reporting System"
arch=('armv7h' 'i686' 'x86_64')
url="http://www.xastir.org/"
license=('GPL' 'LGPL')
depends=('perl' 'python' 'desktop-file-utils' 'openmotif' 'shapelib' 'libxpm'
	 'libax25' 'libxml2' 'gdal' 'graphicsmagick' 'hamradio-menus')
optdepends=('festival: for speech systhesis')
makedepends=('autoconf' 'automake')
conflicts=('xastir-cvs')
source=(https://github.com/Xastir/Xastir/archive/Release-$pkgver.tar.gz
        https://github.com/Xastir/$pkgname-sounds/archive/v1.0.tar.gz
        $pkgname.desktop
        $pkgname-festival.desktop
        $pkgname-speech
        $pkgname.png)

build() {
	cd $srcdir/Xastir-Release-$pkgver
	./bootstrap.sh
	./configure --prefix=/usr

	sed -i -e s:doc/xastir:xastir/doc: Makefile

	make
}

package() {
	cd $srcdir/Xastir-Release-$pkgver
	make DESTDIR=$pkgdir install

	mkdir -p $pkgdir/usr/share/applications
	mkdir -p $pkgdir/usr/share/pixmaps

	cd $srcdir
	install -m644 *.desktop $pkgdir/usr/share/applications/
	install -m644 *.png $pkgdir/usr/share/pixmaps/
	install -m755 $pkgname-speech $pkgdir/usr/bin/

	rm $pkgdir/usr/share/$pkgname/sounds/*
	install -m644 $srcdir/$pkgname-sounds-1.0/sounds/* $pkgdir/usr/share/$pkgname/sounds/

	chmod -s $pkgdir/usr/bin/$pkgname
}
md5sums=('3ce689b89b3c71545f7eafe17da613f8'
         'c314946788a828d42d804670ad23e646'
         '2a06e041a0dc5f20c1427a130613d793'
         '2f8af994b7f5086d4ca2d951ced9019a'
         'e56e55a1c43038d4488fbdd429a0a755'
         '0a7269113052d3bd2711b84ff2fda9d6')
sha256sums=('4d1844a5c9f31407d34fa0339a2b462f8c53991d41045ad16b39ded5dcdfb2fe'
            'fd7b0d60386964b8a35ec2e504238d8393f9217e32607a6ddfaeac6bde7d4f4a'
            '555ee695b83e59ebd270a001d7947bad7c5168ea319d80a3dc7842981975f6ec'
            '3452ca25072da4ccbaad2a8f07a61f1685872e1874cd6b28e5e5571f734fb47b'
            'c99ef0816e0509b7549abdcc41253be2e50499345acd63a19b7b4a17396873b4'
            '4d140434ccadb2772a08a23543bf3692f413d88cb9a39e0a9cf8b8470230e8c6')
