# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Previous Maintainers: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
#      and: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=fldigi
pkgver=4.2.09
pkgrel=1
pkgdesc="Digital Modem Program for Amateur Radio"
arch=('i686' 'x86_64' 'aarch64')
url="http://w1hkj.org"
license=('GPL-2.0-or-later')
depends=('cty' 'fltk' 'libsamplerate' 'flxmlrpc>=1.0.1' 'libsndfile'
         'portaudio' 'libpulse' 'hamlib' 'hamradio-menus')
optdepends=('pulseaudio: pulseaudio support')
source=(http://w1hkj.org/files/$pkgname/$pkgname-$pkgver.tar.gz)

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
md5sums=('d8c8b9dd45db165aaef17d6d39c81000')
sha256sums=('2fe823e0343210e84f60080e42e32d29ff512f31c9e000941ef1897170e22c37')
