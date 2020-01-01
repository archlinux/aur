# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

_pkgname=GSL
pkgname=microsoft-gsl
pkgver=2.1.0
pkgrel=1
pkgdesc="C++ Core Guidelines Support Library"
arch=('any')
url="https://github.com/Microsoft/GSL"
license=('MIT')
makedepends=('cmake')
source=("https://github.com/Microsoft/GSL/archive/v${pkgver}.tar.gz"
        "use_system_catch2.patch")
sha256sums=('ef73814657b073e1be86c8f7353718771bf4149b482b6cb54f99e79b23ff899d'
            '9ebdc1b3628bbdce82e3be469c183cd0d94d3d8964189aad71dac5d7e94d9f58')

build() {
    cd "$_pkgname-$pkgver"
    cmake -H. -Bbuild \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \

    cmake --build build
}

check() {
    cd "$_pkgname-$pkgver"
    cmake --build build -- test
}

package() {
    cd "$_pkgname-$pkgver"
    cmake --build build -- DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
