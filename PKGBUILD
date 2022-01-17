# Maintainer: kiasoc5 <kiasoc5 at tutanota dot com>

pkgname=wapanel
pkgver=1.1.0
pkgrel=1
pkgdesc="Simple panel/status bar/task bar for your custom stacking Wayland-based desktop."
arch=('x86_64')
url="https://github.com/Firstbober/wapanel"
license=('MIT')
depends=('gtk-layer-shell' 'gtk3' 'wayland' 'wayland-protocols' 'libpulse' 'xdg-utils' 'wlroots')
makedepends=('meson' 'toml11' 'pkgconf')
source=(https://github.com/Firstbober/${pkgname}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('4f2f11f0d001b4507b5b1dc6622df68a9e786f590cabf603bc5a3b296039f0a5')

build() {
    arch-meson "$pkgname-$pkgver" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
