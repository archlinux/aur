# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Previous Maintainers: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
#      and: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=fldigi
pkgver=4.1.13
pkgrel=1
pkgdesc="Digital Modem Program for Amateur Radio"
arch=('i686' 'x86_64')
url="http://w1hkj.com"
license=('GPL')
depends=('cty' 'fltk' 'libsamplerate' 'libusb-compat' 'flxmlrpc'
         'portaudio' 'libpulse' 'hamlib' 'hamradio-menus')
optdepends=('libsndfile: sound file support'
            'pulseaudio: pulseaudio support')
source=(http://w1hkj.com/files/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
	cd "$srcdir"

	#patch -p1 < cty.patch
	#patch -p1 < short.patch

	cd $pkgname-$pkgver

	./configure --prefix=/usr \
		--enable-tls --with-flxmlrpc
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
md5sums=('89740f5e5d6277fbee9571d53d1355dc')
sha256sums=('448867a113c35d7ad908fc92774a995dae5e6c4f0f2219e93586c031cb279856')
