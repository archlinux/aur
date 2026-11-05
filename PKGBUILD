# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Fabien Devaux <fdev31@gmail.com>

pkgname=volpack
pkgver=1.0c7
pkgrel=3
pkgdesc="Enhanced version of Philippe Lacroute's volume rendering library"
arch=('i686' 'x86_64')
url="https://amide.sourceforge.net/packages.html"
license=('BSD-3-Clause')
depends=('glibc')
source=("$pkgname-$pkgver.tgz::https://sourceforge.net/projects/amide/files/$pkgname/$pkgver/$pkgname-$pkgver.tgz/download")
sha256sums=('b82b143df479add2b3e18499537a79b1b0fa7e1cc88dff2e7481b4ee075719d2')

build() {
	cd "$pkgname-$pkgver"
	# old K&R-style code: GCC >= 14 otherwise fails (implicit int, incompatible pointer types)
	export CC="gcc -std=gnu89"
	CFLAGS+=" -Wno-error=incompatible-pointer-types -Wno-error=implicit-function-declaration -Wno-error=int-conversion"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
