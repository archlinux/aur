# Maintainer: Louis Opter <kalessin@kalessin.fr>

pkgname=lightsd
pkgver=0.9.1
pkgrel=4
epoch=1
pkgdesc="Daemon to control your LIFX smart bulbs via a JSON-RPC API"
arch=("i686" "x86_64")
url="https://www.github.com/lopter/lightsd/"
license=("GPL3")
depends=("libevent>=2.0.19" "libbsd>=0.5.0")
optdepends=(
    "python: to run the interactive lightsc.py example client"
    "ipython: makes lightsc.py more user-friendly"
)
makedepends=("cmake>=2.8.11")
source=("https://github.com/lopter/lightsd/archive/${pkgver}.tar.gz")
sha256sums=("72eba6074ed18609fb0caf7b7429e1b8f6c3564ca6f81357be22c06ac00956b6")

build() {
    cd "$srcdir/$pkgname-$pkgver"

    cmake                           \
        -DCMAKE_BUILD_TYPE=RELEASE  \
        -DCMAKE_INSTALL_PREFIX=/usr \
        .

    make
}

check() {
    cd "$srcdir/$pkgname-$pkgver"

    make test
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    make DESTDIR="$pkgdir/" install
}
