# Maintainer: Brett Cornwall <ainola@archlinux.org>
# Contributor: gilbus

pkgname=swaylock
pkgver=1.4
pkgrel=2
license=("MIT")
pkgdesc="Screen locker for Wayland"
makedepends=(
    'meson'
    'scdoc'
    'wayland-protocols'
    'git'  # To make the version string
)
depends=(
    'cairo'
    'libxkbcommon'
    'pam'
    'wayland'
    'gdk-pixbuf2'  # For images other than PNG
)
arch=('x86_64')
url="https://github.com/swaywm/swaylock"
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/swaywm/swaylock/archive/$pkgver.tar.gz"
    "https://github.com/swaywm/swaylock/releases/download/$pkgver/$pkgname-$pkgver.tar.gz.sig"
)
sha256sums=('8e6ad33d16370084f5242fd19e0ad631deaeb636cd9699cb8561ca9f18751440'
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
