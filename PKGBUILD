# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Previous Maintainers: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
#      and: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=fldigi
pkgver=4.1.26
pkgrel=1
pkgdesc="Digital Modem Program for Amateur Radio"
arch=('i686' 'x86_64' 'aarch64')
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
md5sums=('052bc3da554b77d9981e00147888665a')
sha256sums=('448ad35a340f9e7d08f1bcd5de431011eb0d68090842786290b31a622beb5917')
