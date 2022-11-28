# Maintainer: Brett Cornwall <ainola@archlinux.org>
# Contributor: gilbus

pkgname=swaylock
pkgver=1.7
pkgrel=1
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
options=(debug)
backup=('etc/pam.d/swaylock')
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('40e99cf62d9aa31727071f865a3e48d431e041fcd533936dc9ba4ffe01ae9cd3'
            'SKIP')
validpgpkeys=(
    "9DDA3B9FA5D58DD5392C78E652CB6609B22DA89A"  # Drew DeVault
    "34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48"  # Simon Ser
)

build() {
    arch-meson "$pkgname-$pkgver" build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir/" ninja -C build install
    install -Dm644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "$pkgname-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
