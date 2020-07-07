# Maintainer: Brett Cornwall <ainola@archlinux.org>
# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=swaybg
pkgver=1.0
pkgrel=4
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
    "$pkgname-$pkgver.tar.gz::https://github.com/swaywm/swaybg/archive/$pkgver.tar.gz"
    "$pkgname-$pkgver.tar.gz.sig::https://github.com/swaywm/swaybg/releases/download/$pkgver/swaybg-$pkgver.tar.gz.sig"
)
sha512sums=('67d0e0109b906ece51800729182940374cc59fa07d0866b57cf876d12191fe12e796b84350a849dc85183fa58a3b2d196191e48dcc03dcc3708a980ed4a8cff0'
            'SKIP')
validpgpkeys=("9DDA3B9FA5D58DD5392C78E652CB6609B22DA89A")  # Drew DeVault

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

# vim: ts=2 sw=2 et:
