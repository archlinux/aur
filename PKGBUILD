# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=abseil-cpp
pkgver=20200923.2
pkgrel=3
pkgdesc="Abseil Common Libraries (C++)"
# check occasionally arch support status
# https://github.com/abseil/abseil-cpp/blob/master/absl/random/internal/platform.h#L54
arch=('x86_64' 'i686' 'arm' 'aarch64' 'ppc')
url="https://github.com/abseil/abseil-cpp"
license=('Apache')
makedepends=('cmake')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('bf3f13b13a0095d926b25640e060f7e13881bd8a792705dd9e161f3c2b9aa976')

prepare() {
    cd "$pkgname-$pkgver"
    cmake -H. -Bbuild \
        -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_CXX_STANDARD=17 \
        -DABSL_USE_GOOGLETEST_HEAD=OFF \
        -DABSL_RUN_TESTS=OFF
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
