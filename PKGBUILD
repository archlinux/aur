# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Previous Maintainers: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
#      and: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=fldigi
pkgver=4.1.21
pkgrel=1
pkgdesc="Digital Modem Program for Amateur Radio"
arch=('i686' 'x86_64')
url="http://w1hkj.com"
license=('GPL')
depends=('cty' 'fltk' 'libsamplerate' 'flxmlrpc>=1.0.1'
         'portaudio' 'libpulse' 'hamlib' 'hamradio-menus')
optdepends=('libsndfile: sound file support'
            'pulseaudio: pulseaudio support')
source=(http://w1hkj.com/files/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
	cd "$srcdir"/$pkgname-$pkgver

	./configure --prefix=/usr \
		--enable-tls --with-flxmlrpc --without-asciidoc
#		--enable-tls --without-flxmlrpc --without-asciidoc
#			(^^^ temporary, until flxmlrpc is updated)
	make ASCIIDOC_ICONS_DIR=/etc/asciidoc/images/icons/
}

check() {
	cd "$srcdir"/$pkgname-$pkgver

	make -k check
}

package() {
	cd "$srcdir"/$pkgname-$pkgver

	make DESTDIR="$pkgdir" install
}
md5sums=('f9dfece16e79eb22ed08be06db4a3f81')
sha256sums=('43a8768c0f8fcffe5509eede1f7e95f18ed6290de3e46573424019a8fb8f8d70')
