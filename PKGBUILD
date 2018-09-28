# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=finalcut
pkgver=0.4.0
pkgrel=1
pkgdesc="A text-based widget toolkit."
arch=('x86_64')
url="https://github.com/gansm/finalcut"
license=('GPL3')
depends=('gpm')
makedepends=()
source=("${url}/archive/$pkgver.tar.gz")
sha256sums=('aca3677effd71381af51ac716e17089b3de9429e62973885669e269bd7a85e0a')

prepare() {
    cd "$pkgname-$pkgver"
    # Does not build because of -Werror=stringop-truncation atm
    sed -i "s/-Werror//" src/Makefile.am

    autoreconf -if
    ./configure --prefix=/usr
}

build() {
    cd "$pkgname-$pkgver"
    make
}

check() {
    cd "$pkgname-$pkgver"
    make check
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}

# vim: set softtabstop=4 shiftwidth=4 expandtab:
