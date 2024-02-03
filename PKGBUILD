# Maintainer: Leonard Iklé <leonard.ikle@gmail.com>

pkgname=cwalk
pkgver=1.2.9
pkgrel=1
pkgdesc="Path library for C/C++. Cross-Platform for Linux, FreeBSD, Windows and MacOS. Supports UNIX and Windows path styles on those platforms."
arch=('x86_64')
url="https://likle.github.io/cwalk/"
license=('MIT')
makedepends=('cmake')
source=("https://github.com/likle/cwalk/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('c02c88d9349f0e0a264686e179ba0ddd')

build() {
  cmake -S "$pkgname-$pkgver" -B build \
    -DCMAKE_BUILD_TYPE="None" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DBUILD_SHARED_LIBS="1" \
    -DENABLE_TESTS="1" \
    -Wno-dev
  cmake --build build
}

check() {
	cd build
	./cwalktest
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
