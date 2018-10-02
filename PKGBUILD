# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Daichi Shinozaki <dsdseg at gmail dot com>

pkgname=wangle
pkgver=2018.10.01.00
pkgrel=1
pkgdesc="A full featured, high performance C++ futures implementation."
arch=('i686' 'x86_64')
url="https://github.com/facebook/wangle"
license=('Apache')
depends=('folly' 'boost-libs')
makedepends=('cmake' 'gflags' 'gtest' 'google-glog' 'boost')
source=("$url/archive/v${pkgver}.tar.gz")
sha256sums=('76477b101809d8c8c7de3415dc294d99e4b7f8a23cfe063c1030738b2ae3e24f')

prepare() {
    cd "$pkgname-$pkgver/$pkgname"
    cmake -H. -Bbuild \
        -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
}

build() {
    cd "$pkgname-$pkgver/$pkgname"
    cmake --build build
}

check() {
    cd "$pkgname-$pkgver/$pkgname"
    cmake --build build -- test
}

package() {
    cd "$pkgname-$pkgver/$pkgname"
    cmake --build build -- DESTDIR=$pkgdir install
}
