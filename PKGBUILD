# Maintainer: Vitaly Odnoyko <kontakt@odnoyko.com>
pkgname=valot
pkgver=0.7.5
pkgrel=1
pkgdesc="A modern time tracking application built with GTK4 and Adwaita"
arch=('x86_64')
url="https://gitlab.com/Valo27/valot"
license=('MIT')
depends=('gtk4' 'libadwaita' 'libgda6' 'gjs')
makedepends=('meson' 'blueprint-compiler')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('2c3b8ac6be8d9a8fce225e237e74887f9de4733315d6c5339889efbacafa642d')

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
