# Maintainer: Andreas Bosch (progandy) <linux+aur@progandy.de>

pkgname=fonttosfnt
pkgver=1.2.1
pkgrel=1
pkgdesc="Convert a set of bdf or pcf fonts in a bitmap only sfnt (otb)."
arch=(x86_64)
url="https://gitlab.freedesktop.org/xorg/app/fonttosfnt"
license=('MIT')
depends=(libfontenc freetype2)
makedepends=(make autoconf automake xorgproto)
source=("https://xorg.freedesktop.org/archive/individual/app/fonttosfnt-$pkgver.tar.gz"{,.sig})
sha256sums=('208efbf4f8edc3eb8818b3c537d327bb48afc3853d7bcec48075716af7a51f3d'
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
