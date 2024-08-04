
# Maintainer: Windel Bouwman <windel@windel.nl>
# Contributor: Tong Chunli (tty2099@gmail.com) 

pkgname=fastcdr
_pkgnm=Fast-CDR
pkgver=2.2.3
pkgrel=1
pkgdesc="A C++ library that provides two serialization mechanisms. One is the standard CDR serialization mechanism, while the other is a faster implementation that modifies the standard."
arch=(x86_64)
url="https://github.com/eProsima/Fast-CDR"
license=('Apache-2.0')
depends=()
makedepends=(cmake)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/eProsima/Fast-CDR/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=("67fb60b436f0a45050285b7db560bc69")

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

