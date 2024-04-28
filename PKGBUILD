# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Previous Maintainers: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
#      and: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=fldigi
pkgver=4.2.05
pkgrel=1
pkgdesc="Digital Modem Program for Amateur Radio"
arch=('i686' 'x86_64' 'aarch64')
url="http://w1hkj.com"
license=('GPL-2.0-or-later')
depends=('cty' 'fltk' 'libsamplerate' 'flxmlrpc>=1.0.1' 'libsndfile'
         'portaudio' 'libpulse' 'hamlib' 'hamradio-menus')
optdepends=('pulseaudio: pulseaudio support')
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
md5sums=('3003238351de786d10480bd060509cd4')
sha256sums=('ac1189fbadd2ce1cb7ecb430d0ba44dbf94bc8fe65c0aee1b33feeab8e778876')
