# Maintainer: mfwolffe <wolffemf@dukes.jmu.edu>
pkgname=fortty
pkgver=0.1.4
pkgrel=1
pkgdesc="GPU-accelerated terminal emulator written in Fortran"
arch=('x86_64')
url="https://github.com/FortranGoingOnForty/fortty"
license=('MIT')
depends=('glfw' 'freetype2' 'fontconfig')
makedepends=('cmake' 'gcc-fortran')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FortranGoingOnForty/fortty/archive/refs/tags/v$pkgver.tar.gz"
        "fortty.desktop")
sha256sums=('d8620f932e286679e0cc09af28fa6d395311ee8da7230a2f2c588127331233f3'
            'SKIP')

build() {
    cd "$pkgname-$pkgver"
    cmake -B build -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 build/fortty "$pkgdir/usr/bin/fortty"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/fortty.desktop" "$pkgdir/usr/share/applications/fortty.desktop"
}
