
# Maintainer: Windel Bouwman <windel@windel.nl>
# Contributor: Tong Chunli (tty2099@gmail.com) 

pkgname=fastcdr
_pkgnm=Fast-CDR
pkgver=2.3.0
pkgrel=1
pkgdesc="A C++ library that provides two serialization mechanisms. One is the standard CDR serialization mechanism, while the other is a faster implementation that modifies the standard."
arch=(x86_64)
url="https://github.com/eProsima/Fast-CDR"
license=('Apache-2.0')
depends=()
makedepends=(cmake)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/eProsima/Fast-CDR/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=("4355c0ec4dbd73a9f5d30f5786d111c7")

build() {
    cmake -B build -S "Fast-CDR-$pkgver" \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTING=ON
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package(){
    DESTDIR="$pkgdir" cmake --install build
}

