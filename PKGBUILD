# Maintainer: iciclejj
pkgname=scran
pkgver=0.8.1
pkgrel=1
pkgdesc='Image and video capture for Wayland'
arch=('x86_64')
url='https://github.com/iciclejj/scran'
license=('MIT')
makedepends=('wayland-protocols')
depends=(
    'wayland>=1.14.91'
    'libxkbcommon'
    'libsystemd'
    'libpipewire'
    'ffmpeg'
    'blend2d'
)

source=("$pkgname-$pkgver.tar.gz::https://github.com/iciclejj/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c84b7eaf4d15d376e3814f69e5a065dd4c281a1d100ffa814a899b010d659619')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make release SD_BUS_LIB=libsystemd
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -D -m 755 "./build/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -D -m 644 "./LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
