# Maintainer: Vitaly Odnoyko <kontakt@odnoyko.com>
pkgname=valot
pkgver=0.9.0
pkgrel=1
pkgdesc="A modern time tracking application built with GTK4 and Adwaita"
arch=('x86_64')
url="https://gitlab.com/Valo27/valot"
license=('MIT')
depends=('gtk4' 'libadwaita' 'libgda6' 'gjs')
makedepends=('meson' 'blueprint-compiler')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('e3e0bf2c8f7fa90f2a60c8297a20b0f423f85c0ff909e4b89de82a59aa0546a3')

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
}
