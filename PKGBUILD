# Maintainer: nontlikeuname

pkgname=templar-git
pkgver=5d81da1
pkgrel=1
pkgdesc="Visualization tool for Templight C++ template debugger traces"
arch=(any)
depends=()
makedepends=('git' 'qt5-base' 'clang-trunk')
#checkdepends=(gcc-objc gnustep-make vala rust gcc-fortran mono boost qt5-base) #gtest or googletest
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/schulmar/Templar')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/Templar"
	printf "%s" "$(git describe --long --always | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/Templar"
	qmake
	make
}

package() {
	cd "$srcdir/Templar"
	install -Dm755 Templar "${pkgdir}/usr/bin/Templar"
}
