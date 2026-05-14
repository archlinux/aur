# Maintainer: iciclejj
pkgname=scran
pkgver='0.9.2'
pkgrel=1
pkgdesc='Image and video capture for Wayland'
arch=('x86_64')
url='https://github.com/iciclejj/scran'
license=('MIT AND OFL-1.1')
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
sha256sums=('739133ddfc8fb7481f069b881875c32076107433a863ef81a92740f9cc0bc7c9')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make release SD_BUS_LIB=libsystemd
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -D -m 755 "./build/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -D -m 644 "./LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m 644 "./assets/Iosevka.license" "$pkgdir/usr/share/licenses/$pkgname/Iosevka.license"
    install -D -m 644 "./assets/NerdFontsSymbolsOnly.license" "$pkgdir/usr/share/licenses/$pkgname/NerdFontsSymbolsOnly.license"
}
