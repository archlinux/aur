pkgname=openloco
_pkgname=OpenLoco
pkgver=23.06
pkgrel=1
pkgdesc="An open source re-implementation of Chris Sawyer's Locomotion"
arch=('x86_64')
url="https://github.com/OpenLoco/OpenLoco"
license=('MIT')
depends=()
makedepends=('cmake' 'gtest' 'lib32-glibc' 'yaml-cpp')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2e1982399b5b1165d8c3ee84c376a60f0e41965ae179508d9747c030da4a1835')


build() {
    cd ${_pkgname}-${pkgver}
    sed -i  's/option(OPENLOCO_BUILD_TESTS "Build tests" YES)/option(OPENLOCO_BUILD_TESTS "Build tests" NO)/' CMakeLists.txt

    rm -rf "build"
    mkdir -p "build"
    cd build
    
    cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release ../
    make
}

package() {
    cd ${_pkgname}-${pkgver}
    DESTDIR="$pkgdir" cmake -P cmake_install.cmake --install build
}

