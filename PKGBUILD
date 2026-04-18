# Maintainer: iciclejj
pkgname=scran
pkgver=0.7.1
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
    'ffmpeg'
    'blend2d'
)

source=("$pkgname-$pkgver.tar.gz::https://github.com/iciclejj/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d50cd5f7a3f11e25a8b5c47e738d107f4d10018f7567d99b6d7f0c04c39d9b0a')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make release SD_BUS_LIB=libsystemd
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -D -m 755 "./build/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -D -m 644 "./LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
