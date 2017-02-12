# Maintainer: Louis Opter <kalessin@kalessin.fr>

pkgname=lightsd
pkgver=1.2.1~rc.3
# This will have - instead of ~ for rc versions:
_lightsdver=1.2.1-rc.3
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
source=("https://downloads.lightsd.io/releases/lightsd-1.2.1-rc.3.tar.gz")
sha256sums=("2aa94c910e5581b427f80a2a95858c57c321b196921bdbdc945d996c9d325871")
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