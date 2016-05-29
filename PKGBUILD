# Maintainer: Louis Opter <kalessin@kalessin.fr>

pkgname=lightsd
pkgver=1.2.0-rc.1
pkgrel=1
epoch=1
pkgdesc="Daemon to control your LIFX smart bulbs via a JSON-RPC API"
arch=("i686" "x86_64")
url="https://www.github.com/lopter/lightsd/"
license=("GPL3")
depends=("libevent>=2.0.19")
optdepends=(
    "python: to run the interactive lightsc.py example client"
    "ipython: makes lightsc.py more user-friendly"
)
makedepends=("cmake>=2.8.11")
source=("https://downloads.lightsd.io/releases/lightsd-1.2.0-rc.1.tar.gz")
sha256sums=("1902996841122f353360b1cdc4e632a45fc164d47c6d56ff8e3ae855c460c6e6")
install=lightsd.install

build() {
    cd "$srcdir/$pkgname-$pkgver"

    cmake .                         \
        -DCMAKE_BUILD_TYPE=RELEASE  \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLGTD_RUNTIME_DIRECTORY=/run/lightsd

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
