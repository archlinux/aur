# Maintainer: Julian Hornich <hornich at kth dot se>
pkgname=parallel-hashmap-git
pkgver=1.0.0_20200519
pkgrel=1
pkgdesc="A set of excellent c++ hash map implementations"
arch=('any')
url="https://github.com/greg7mdp/parallel-hashmap"
license=('apache')
depends=()
makedepends=('gcc' 'cmake')
optdepends=()
source=('git+https://github.com/greg7mdp/parallel-hashmap.git')
sha256sums=('SKIP')

_version=1.0.0

pkgver() {
	cd parallel-hashmap
	echo "${_version}_$(git log --format="%cd" --date=short -1 | sed 's/-//g')" | sed 's/-/_/g'
}

build() {
	cd parallel-hashmap
	mkdir build
	cd build

	cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
				-DPHMAP_BUILD_TESTS=ON \
				-DPHMAP_BUILD_EXAMPLES=ON ..

	make ${MAKEFLAGS}
}

check() {
	cd parallel-hashmap/build
	make ${MAKEFLAGS} test
}

package() {
	cd parallel-hashmap/build
	make install
}
