# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=xbyak
pkgname=$_pkgname-git
pkgver=6.62.r0.g7bccdbb
pkgrel=1
pkgdesc="C++ header-only JIT assembler library for x86/x86-64"
arch=('any')
url="https://github.com/herumi/xbyak"
license=('BSD')
makedepends=('cmake' 'git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -S $_pkgname -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	cmake --build build
}

package() {
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/COPYRIGHT
}
