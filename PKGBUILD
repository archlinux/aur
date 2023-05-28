# Maintainer: x2b <psaoj.10.Toranaga-San@spamgourmet.com>

pkgname=highs
pkgver=1.5.3
pkgrel=1
pkgdesc="Linear optimization software"
arch=('i686' 'x86_64')
_pkgname=HiGHS
url="https://github.com/ERGO-Code/HiGHS"
license=('MIT')
depends=('gcc-libs' 'zlib')
makedepends=('cmake')
source=("https://github.com/ERGO-Code/HiGHS/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ce1a7d2f008e60cc69ab06f8b16831bd0fcd5f6002d3bbebae9d7a3513a1d01d')

prepare() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    mkdir -p "build"
    cd "build"

    cmake \
      -DCMAKE_EXE_LINKER_FLAGS=$LDFLAGS \
      -DCMAKE_SHARED_LINKER_FLAGS=$LDFLAGS \
      -DCMAKE_INSTALL_PREFIX=/usr \
      ..
}

build() {
    cd "$srcdir/${_pkgname}-${pkgver}/build"
    make
}

check() {
    cd "$srcdir/${_pkgname}-${pkgver}/build"
    make test
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}/build"
    make DESTDIR="$pkgdir/" install

    cd "$srcdir/${_pkgname}-${pkgver}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
