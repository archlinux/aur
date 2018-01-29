# Maintainer: Vladimír Štill <vl.still@gmail.com>
pkgname="sylvan"
pkgver="1.4.0"
pkgrel=1
pkgdesc="Sylvan is a parallel (multi-core) MTBDD library written in C."
arch=('x86_64')
url="https://github.com/trolando/sylvan"
license=('Apache2.0')
depends=(gcc-libs)
makedepends=()
source=("https://github.com/trolando/sylvan/archive/v${pkgver}.tar.gz")
sha256sums=('a316db7adadd5578d2b25f037eba29614b65060c6ff47edbdc2d2578ccc0edc9')

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
    mv $pkgdir/usr/lib64 $pkgdir/usr/lib
}
