# Maintainer: Vladimír Štill <vl.still@gmail.com>
pkgname="sylvan"
pkgver="1.5.0"
pkgrel=1
pkgdesc="Sylvan is a parallel (multi-core) MTBDD library written in C."
arch=('x86_64')
url="https://github.com/trolando/sylvan"
license=('Apache2.0')
depends=(gcc-libs)
makedepends=(cmake)
source=("https://github.com/trolando/sylvan/archive/v${pkgver}.tar.gz")
sha256sums=('20ddce6da58943655ded77795c82e34ccb329dc24b40a1fe39f6c7a764ae5452')

build() {
    cd "$pkgname-$pkgver"
    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make
}

check() {
    cd "$pkgname-$pkgver/build"
    make -k test
}

package() {
    cd "$pkgname-$pkgver/build"
    make DESTDIR="$pkgdir/" install
    cd ..
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
