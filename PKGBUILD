# Maintainer: Vitaly Odnoyko <kontakt@odnoyko.com>
pkgname=valot
pkgver=0.7.3
pkgrel=1
pkgdesc="A modern time tracking application built with GTK4 and Adwaita"
arch=('x86_64')
url="https://gitlab.com/Valo27/valot"
license=('MIT')
depends=('gtk4' 'libadwaita' 'libgda6' 'gjs')
makedepends=('meson' 'blueprint-compiler')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('1d0c925473859e9eb5c89485bc0c947f8cb150e0db0b137b1fd0b94573937411')

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
