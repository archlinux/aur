pkgname=openloco
_pkgname=OpenLoco
pkgver=23.05
pkgrel=1
pkgdesc="An open source re-implementation of Chris Sawyer's Locomotion"
arch=('x86_64')
url="https://github.com/OpenLoco/OpenLoco"
license=('MIT')
depends=()
makedepends=('cmake' 'gtest' 'lib32-glibc' 'yaml-cpp')
source=("https://github.com/${_pkgname}/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('19c867f311dde3f934d4d075d0931117f8480563a0dd576ca35182648ae38b71')


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

