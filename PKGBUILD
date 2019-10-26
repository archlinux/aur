# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=dbow2-git
pkgver=r28.4d08e9f
pkgrel=1
pkgdesc="Enhanced hierarchical bag-of-word library for C++."
arch=('x86_64')
url="https://github.com/dorian3d/DBoW2"
license=('custom')
depends=('gcc')
makedepends=('cmake' 'gcc')
provides=('dbow2')
_name=DBoW2
source=("git+https://github.com/dorian3d/DBoW2.git"
        LICENSE.txt)
sha256sums=('SKIP'
            'c02e19ed871eb9dd11b01db600d3f3601c5a03c4121f6baeb2ebe215ecbeaf23')

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_name}"
	mkdir -p build
	cd build
	cmake .. \
		-DBUILD_Demo=OFF \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${_name}/build"
	make DESTDIR="$pkgdir/" install
}
