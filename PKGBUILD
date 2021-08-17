# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=xbyak
pkgname=$_pkgname-git
pkgver=5.995.r3.gc313a87
pkgrel=1
pkgdesc='C++ header-only JIT assembler library for x86/x86-64'
arch=('any')
url="https://github.com/herumi/$_pkgname"
license=('BSD')
makedepends=('cmake' 'git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -S $_pkgname -B build \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	cmake --build build
}

package() {
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/COPYRIGHT
}
