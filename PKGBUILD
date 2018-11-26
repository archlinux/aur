# Maintainer: Aleksandar Trifunović <akstrfn at gmail dot com>

pkgname=finalcut
pkgver=0.5.0
pkgrel=1
pkgdesc="A text-based widget toolkit."
arch=('x86_64')
url="https://github.com/gansm/finalcut"
license=('GPL3')
depends=('gpm')
makedepends=()
source=("${url}/archive/$pkgver.tar.gz")
sha256sums=('eb230ff878ba8b4c2f2a0722e7848180e2412c9bcb4e194d951b97d1fb77539f')

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
