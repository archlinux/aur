# Maintainer: Louis Opter <kalessin@kalessin.fr>

pkgname=lightsd
pkgver=1.2.0~rc.5
# This will have - instead of ~ for rc versions:
_lightsdver=1.2.0-rc.5
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
source=("https://downloads.lightsd.io/releases/lightsd-1.2.0-rc.5.tar.gz")
sha256sums=("93dc954ca39542479ecaafaeaa6984d50616b79aa4b1c9e15242fbfdbc38d9c4")
install=lightsd.install

build() {
    cd "$srcdir/$pkgname-$_lightsdver"

    cmake .                         \
        -DCMAKE_BUILD_TYPE=RELEASE  \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLGTD_RUNTIME_DIRECTORY=/run/lightsd

    make
}

check() {
    cd "$srcdir/$pkgname-$_lightsdver"

    make test
}

package() {
    cd "$srcdir/$pkgname-$_lightsdver"

    make DESTDIR="$pkgdir/" install
}