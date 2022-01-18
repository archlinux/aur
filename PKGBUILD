# Maintainer: Onur Kader <onurorkunkader1999@gmail.com>
pkgname=scnlib-git
pkgver=r396.9e7d038
pkgrel=1
pkgdesc="A formatted input library, think {fmt} but in the other direction. 'scanf' for modern C++"
arch=("x86_64")
url="https://github.com/eliaskosunen/scnlib"
license=("Apache")
makedepends=("git" "cmake")
provides=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/eliaskosunen/scnlib.git")
md5sums=("SKIP")
options=(!strip)

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	mkdir build
	cd build
	cmake -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON -DCMAKE_INSTALL_PREFIX="/usr" ..
	cmake --build .
}

check() {
	cd "$srcdir/$pkgname/build"
	cmake --build . --target test
}

package() {
	cd "$srcdir/$pkgname/build"
	DESTDIR="$pkgdir/" cmake --install .
}

