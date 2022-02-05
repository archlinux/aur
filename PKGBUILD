# Maintainer: Brett Cornwall <ainola@archlinux.org>
# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=swaybg
pkgver=1.1
pkgrel=3
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
options=(debug)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/swaywm/swaybg/releases/download/v$pkgver/swaybg-$pkgver.tar.gz"
    "$pkgname-$pkgver.tar.gz.sig::https://github.com/swaywm/swaybg/releases/download/v$pkgver/swaybg-$pkgver.tar.gz.sig"
)
sha512sums=('2b262402c4d93908facde82b07a3df1ee698b802b7e9c07e6eff0325cb9ddf712c544574c5aeb481f69dfb1857a88bf8e654bfe0dd3b2178fd3a44109e104692'
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
