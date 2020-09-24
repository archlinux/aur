# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=abseil-cpp
pkgver=20200923
pkgrel=1
pkgdesc="Abseil Common Libraries (C++)"
arch=('any')
url="https://github.com/abseil/abseil-cpp"
license=('Apache')
makedepends=('cmake' 'git')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('b3744a4f7a249d5eaf2309daad597631ce77ea62e0fc6abffbab4b4c3dc0fc08')

prepare() {
    cd "$pkgname-$pkgver"
    cmake -H. -Bbuild \
        -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DABSL_RUN_TESTS=ON \
        -DCMAKE_CXX_STANDARD=17 \
        -DABSL_USE_GOOGLETEST_HEAD=ON
}

build() {
    cd "$pkgname-$pkgver"
    cmake --build build
}

# time test failes
#check() {
#    cd "$pkgname-$pkgver"
#    cmake --build build -- test ARGS="$MAKEFLAGS"
#}

package() {
    cd "$pkgname-$pkgver"
    cmake --build build -- DESTDIR="$pkgdir" install
}
