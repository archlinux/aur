# Maintainer: iciclejj
pkgname=scran
pkgver='0.9.0'
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
sha256sums=('f8ecd4945a542cb6d98d94bd14b20ee02c5efb30fc15a6f91a3b50374014a3e4')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make release SD_BUS_LIB=libsystemd
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -D -m 755 "./build/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -D -m 644 "./LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
