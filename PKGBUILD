# Maintainer: mfwolffe <wolffemf@dukes.jmu.edu>
pkgname=fortty
pkgver=0.1.7
pkgrel=1
pkgdesc="GPU-accelerated terminal emulator written in Fortran"
arch=('x86_64')
url="https://github.com/FortranGoingOnForty/fortty"
license=('MIT')
depends=('glfw' 'freetype2' 'fontconfig')
makedepends=('cmake' 'gcc-fortran')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FortranGoingOnForty/fortty/archive/refs/tags/v$pkgver.tar.gz"
        "fortty.desktop")
sha256sums=('9be7b27cb4df3a70a98bc6e4a75ed7e2c8afc96b28d75e4d3fd0ff43452cdc95'
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
