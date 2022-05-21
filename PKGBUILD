# Maintainer: x2b <psaoj.10.Toranaga-San@spamgourmet.com>

pkgname=highs
pkgver=1.2.2
pkgrel=1
pkgdesc="Linear optimization software"
arch=('i686' 'x86_64')
_pkgname=HiGHS
url="https://github.com/ERGO-Code/HiGHS"
license=('MIT')
depends=('gcc-libs' 'zlib')
makedepends=('cmake')
source=("https://github.com/ERGO-Code/HiGHS/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e849276134eb0e7d876be655ff5fe3aa6ecf1030d605edee760620469f9e97cf')

prepare() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    mkdir -p "build"
    cd "build"

    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
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
