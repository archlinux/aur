pkgname=openloco
_pkgname=OpenLoco
pkgver=23.06.1
pkgrel=1
pkgdesc="An open source re-implementation of Chris Sawyer's Locomotion"
arch=('x86_64')
url="https://github.com/OpenLoco/OpenLoco"
license=('MIT')
depends=()
makedepends=('cmake' 'lib32-glibc' 'yaml-cpp')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ce8a6f5a5a76880197495346824304c8ef7c42553d7081784c4454ea54d87849')


build() {
    cd ${_pkgname}-${pkgver}
    sed -i  's/option(OPENLOCO_BUILD_TESTS "Build tests" YES)/option(OPENLOCO_BUILD_TESTS "Build tests" NO)/' CMakeLists.txt

    rm -rf "build"
    mkdir -p "build"
    cd build
    
    cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release ../ -DSTRICT=Off
    make
}

package() {
    cd ${_pkgname}-${pkgver}
    DESTDIR="$pkgdir" cmake -P cmake_install.cmake --install build
}

