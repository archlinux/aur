# Maintainer: Brett Cornwall <ainola@archlinux.org>
# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=swaybg
pkgver=1.2.0
pkgrel=1
pkgdesc='Wallpaper tool for Wayland compositors'
arch=(x86_64)
url='https://github.com/swaywm/swaybg'
license=(MIT)
makedepends=(meson
             ninja
             scdoc
             wayland-protocols)
depends=(
    'wayland'
    'cairo'
    'gdk-pixbuf2'  # For images other than PNG
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/swaywm/swaybg/releases/download/v$pkgver/swaybg-$pkgver.tar.gz"
    "$pkgname-$pkgver.tar.gz.sig::https://github.com/swaywm/swaybg/releases/download/v$pkgver/swaybg-$pkgver.tar.gz.sig"
)
b2sums=('8b2154e90ec52db77d83bcf3aff49eb79ee44e533350b875b6b93e30261b97a1c737bf5d43e19247434aa76a740d5b0ae4f3f81f0b4b0c9b2122cfc08b0d274d'
        'SKIP')
validpgpkeys=(
    "9DDA3B9FA5D58DD5392C78E652CB6609B22DA89A"  # Drew DeVault
    "34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48"  # Simon Ser
)

build() {
    meson "$pkgname-$pkgver" build \
        --prefix /usr \
        --buildtype=plain
    ninja -C build
}

package() {
    DESTDIR="$pkgdir/" ninja -C build install
    install -Dm644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "$pkgname-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
