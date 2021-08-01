# Maintainer: Andreas Bosch (progandy) <linux+aur@progandy.de>

pkgname=fonttosfnt
pkgver=1.2.2
pkgrel=1
pkgdesc="Convert a set of bdf or pcf fonts in a bitmap only sfnt (otb)."
arch=(x86_64)
url="https://gitlab.freedesktop.org/xorg/app/fonttosfnt"
license=('MIT')
depends=(libfontenc freetype2)
makedepends=(make autoconf automake xorgproto)
source=("https://xorg.freedesktop.org/archive/individual/app/fonttosfnt-$pkgver.tar.gz"{,.sig})
sha256sums=('8111317c38f63aff08c717595e65381af7ebfc54ccc23511c2042ef1cd86c648'
            'SKIP')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
