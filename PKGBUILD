# Maintainer: éclairevoyant

_pkgname=yyjson
pkgname="$_pkgname-git"
pkgver=0.8.0.r17.f1867b0
pkgrel=1
pkgdesc="High performance C JSON library"
arch=(x86_64)
url="https://ibireme.github.io/yyjson/"
license=(MIT)
depends=(glibc)
makedepends=(cmake git)
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")
source=("git+https://github.com/ibireme/yyjson.git")
b2sums=('SKIP')

pkgver() {
	git -C $_pkgname describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cmake -S $_pkgname -B build \
		-DBUILD_SHARED_LIBS=ON \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \

	cmake --build build
}

package() {
	make -C build DESTDIR="${pkgdir}" install
	install -vDm644 $_pkgname/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
