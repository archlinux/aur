# Maintainer: iciclejj
pkgname=scran
pkgver='0.12.1'
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
sha256sums=('3897be34217b38194cd1a5793c60e148ec3add12d287cfabff857fd16010d056')

build() {
    arch-meson "$pkgname-$pkgver" build -D sd-bus-provider=libsystemd
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    meson install -C build --destdir "$pkgdir"

    install -D -m 644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m 644 "$srcdir/$pkgname-$pkgver/assets/Iosevka.license" "$pkgdir/usr/share/licenses/$pkgname/Iosevka.license"
    install -D -m 644 "$srcdir/$pkgname-$pkgver/assets/NerdFontsSymbolsOnly.license" "$pkgdir/usr/share/licenses/$pkgname/NerdFontsSymbolsOnly.license"
}
