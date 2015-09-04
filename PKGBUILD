# Maintainer: Louis Opter <kalessin@kalessin.fr>

pkgname=lightsd
pkgver=0.9.1
pkgrel=1
epoch=1
pkgdesc="Daemon to control your LIFX smart bulbs via a JSON-RPC API"
arch=("i686" "x86_64")
url="https://www.github.com/lopter/lightsd/"
license=("GPL3")
depends=("libevent>=2.0.19" "libbsd>=0.5.0")
optdepends=("python: to run the interactive lightsc.py example client")
makedepends=("cmake>=2.8.11")
source=("https://api.github.com/repos/lopter/$pkgname/tarball/$pkgver")
sha256sums=("ef4f8056bf39c8f2c440e442f047cafce1c102e565bb007791a27f77588157c2")

prepare() {
    cd "$srcdir"

    mv lopter-lightsd-* "$pkgname-$pkgver"
}

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
