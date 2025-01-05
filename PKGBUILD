# Maintainer: Max von Forell <max@vonforell.de>
# Contributor: Brett Cornwall <ainola@archlinux.org>
# Contributor: Robin Candau <antiz@archlinux.org>
# Contributor: gilbus

_pkgbase=swaylock
pkgname="$_pkgbase-clock"
pkgver=1.8.0
pkgrel=1
license=("MIT")
pkgdesc="Screen locker for Wayland, with extra clock functionality"
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
conflicts=('swaylock')
provides=('swaylock')
arch=('x86_64')
url="https://git.sr.ht/~mvforell/swaylock"
backup=('etc/pam.d/swaylock')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('b7438de0859902f7a13bedd26dd8b7faf66960c80bf25af119ea3073db9b813f')

build() {
    arch-meson "$_pkgbase-$pkgver" build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir/" ninja -C build install
    install -Dm644 "$_pkgbase-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "$_pkgbase-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
