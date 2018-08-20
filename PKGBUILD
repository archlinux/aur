# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

_pkgname=GSL
pkgname=microsoft-gsl
pkgver=2.0.0
pkgrel=1
pkgdesc="C++ Core Guidelines Support Library"
arch=('any')
url="https://github.com/Microsoft/GSL"
license=('MIT')
makedepends=('cmake' 'git')
source=("$url/archive/v${pkgver}.tar.gz")
sha256sums=('6cce6fb16b651e62711a4f58e484931013c33979b795d1b1f7646f640cfa9c8e')

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
