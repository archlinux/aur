# Maintainer: Brett Cornwall <ainola@archlinux.org>
# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Maxim Baz <archlinux at maximbaz dot com>

pkgname=swaybg
pkgver=1.2.1
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
b2sums=('0183f11c2d8a967054572676a1c87c7d533c8f4a7bd204049d53e350966dfc825d2d779d0d8165cec9b8e019b9c1bc7a0b7702270b02aa0f02bfbc8400ec6b53'
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
