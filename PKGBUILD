# Maintainer: Vitaly Odnoyko <kontakt@odnoyko.com>
pkgname=valot
pkgver=0.9.5b1
pkgrel=1
pkgdesc="A modern time tracking application built with GTK4 and Adwaita"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/valot/linux/valot"
license=('MIT')
depends=('gtk4' 'libadwaita' 'libgda6' 'gjs' 'libsoup3')
makedepends=('meson')
source=("$pkgname-v$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('a1f5dbaf402d1541e2ab89aa4fa003b54c964fc344f3eeaf634a42f3dfe3fc1e')

build() {
    cd "$pkgname-v$pkgver"
    arch-meson . build
    meson compile -C build
}

check() {
    cd "$pkgname-v$pkgver"
    meson test -C build --print-errorlogs || true
}

package() {
    cd "$pkgname-v$pkgver"
    meson install -C build --destdir "$pkgdir"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
