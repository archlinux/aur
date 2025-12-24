# Maintainer: mfwolffe <wolffemf@dukes.jmu.edu>
pkgname=fortty
pkgver=0.1.5
pkgrel=1
pkgdesc="GPU-accelerated terminal emulator written in Fortran"
arch=('x86_64')
url="https://github.com/FortranGoingOnForty/fortty"
license=('MIT')
depends=('glfw' 'freetype2' 'fontconfig')
makedepends=('cmake' 'gcc-fortran')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FortranGoingOnForty/fortty/archive/refs/tags/v$pkgver.tar.gz"
        "fortty.desktop")
sha256sums=('337da567e7d7efefdd6e516e111831f3c9a0a6a91e2c16dea8fe3380831b4c82'
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
