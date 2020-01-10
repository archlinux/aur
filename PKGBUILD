# Maintainer: Azat Abdullin <abdullin@kspt.icc.spbstu.ru>
pkgname=btor2tools-unstable-git
pkgver=r77.9831f99
pkgrel=2
pkgdesc="A generic parser and tool package for the BTOR2 format."
arch=('any')
url="https://github.com/Boolector/btor2tools"
license=('MIT')
depends=()
makedepends=("git" "cmake" "make")
conflicts=("btor2tools-git")
source=("git://github.com/Boolector/btor2tools.git")
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/btor2tools"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/btor2tools"
	CFLAGS="" ./configure.sh 
	cd build
	make
}

package() {
	cd "$srcdir/btor2tools"

	bindir="$pkgdir/usr/bin"
	libdir="$pkgdir/usr/lib"
	includedir="$pkgdir/include/btor2parser"

	mkdir -p "$bindir"
	mkdir -p "$libdir"
	mkdir -p "$includedir"

	install -m755 ./build/bin/* "$bindir"
	install -m755 ./build/lib/*.so "$libdir"
	install -m755 ./src/btor2parser/*.h "$includedir"
}
