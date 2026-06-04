# Maintainer: iciclejj
pkgname=scran
pkgver='0.10.0'
pkgrel=1
pkgdesc='Image and video capture for Wayland'
arch=('x86_64')
url='https://github.com/iciclejj/scran'
license=('MIT AND OFL-1.1')
makedepends=('wayland-protocols' 'meson')
depends=(
    'wayland>=1.14.91'
    'libxkbcommon'
    'libsystemd'
    'libpipewire'
    'ffmpeg'
    'blend2d'
)

source=("$pkgname-$pkgver.tar.gz::https://github.com/iciclejj/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('06a136d35d887b3ad30a07c408a9980581a763ff6d3d28e0de34b7d9b60b73d0')

build() {
    arch-meson "$pkgname-$pkgver" build -D sd-bus-provider=libsystemd
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"

    install -D -m 644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m 644 "$srcdir/$pkgname-$pkgver/assets/Iosevka.license" "$pkgdir/usr/share/licenses/$pkgname/Iosevka.license"
    install -D -m 644 "$srcdir/$pkgname-$pkgver/assets/NerdFontsSymbolsOnly.license" "$pkgdir/usr/share/licenses/$pkgname/NerdFontsSymbolsOnly.license"
}
