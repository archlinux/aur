# Maintainer: gilzoide <gilzoide at gmail dot com>

pkgname=pega-texto-git
pkgver=r43.4271673
pkgrel=1
pkgdesc="A runtime engine for Parsing Expression Grammars (PEG) in C"
arch=('i686' 'x86_64')
url="https://github.com/gilzoide/pega-texto"
license=("LGPL3")
depends=()
makedepends=('git' 'cmake')
source=("$pkgname"::'git://github.com/gilzoide/pega-texto.git')
md5sums=('SKIP')

# Make pkg version as last commit date
pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# Build with cmake
# Change `CMAKE_BUILD_TYPE` to "Debug" for debug builds
build() {
	cd "$pkgname"
	mkdir -p build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd "$pkgname/build"
	make install
}
