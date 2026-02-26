# Maintainer: Brett Cornwall <ainola@archlinux.org>
# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Maxim Baz <archlinux at maximbaz dot com>

pkgname=swaybg
pkgver=1.2.2
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
b2sums=('670d4a232458109d839dc269d0c67013d98180b64bdc04aafec91001b4f875928987aad0d27bec15a947daa05a0a8e5fbfdf3cf2f86f95aa4c4817e9150bc144'
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
