# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=kookbook-git
pkgver=0.2.1.r92.gd6db5f9
pkgrel=1
pkgdesc="Cookbook creator"
arch=(x86_64)
url="https://invent.kde.org/utilities/kookbook"
license=(MIT)
depends=(qt5-base qt5-declarative)
makedepends=(git cmake extra-cmake-modules)
provides=(kookbook)
conflicts=(kookbook)
source=("git+https://invent.kde.org/utilities/kookbook.git")
sha512sums=('SKIP')

pkgver() {
    cd kookbook
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../kookbook \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install

    install -Dm644 ../kookbook/COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
