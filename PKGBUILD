pkgname=libchloride-git
pkgver=1
pkgrel=3
pkgdesc="Networking layer for libsodium, based on CurveCP"
arch=(i686 x86_64)
url="https://github.com/jedisct1/libchloride"
license=()
depends=(libsodium)
options=('staticlibs')
source=("$pkgname::git+https://github.com/jedisct1/libchloride.git")
sha256sums=('SKIP')

build() {
	cd "$pkgname"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
	install -dm0755 "$pkgdir"/usr/{lib,include/libcurvecp}
	install -m0644 src/curvecp/libcurvecp/*.h "$pkgdir"/usr/include/libcurvecp/
	install -m0644 src/curvecp/libcurvecp/.libs/*.a "$pkgdir"/usr/lib/
}
