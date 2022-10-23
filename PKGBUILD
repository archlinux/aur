# Maintainer: x2b <psaoj.10.Toranaga-San@spamgourmet.com>

pkgname=highs
pkgver=1.3.0
pkgrel=1
pkgdesc="Linear optimization software"
arch=('i686' 'x86_64')
_pkgname=HiGHS
url="https://github.com/ERGO-Code/HiGHS"
license=('MIT')
depends=('gcc-libs' 'zlib')
makedepends=('cmake')
source=("https://github.com/ERGO-Code/HiGHS/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('627b2e91f610c74c28848c6afc4a74b37c561b8827662ea04a9ed05c8f79d029')

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
