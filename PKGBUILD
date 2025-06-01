# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=wio
pkgname=$_name-wl
pkgver=0.19.0
pkgrel=1
pkgdesc="Wayland compositor similar to Plan 9's rio"
arch=(x86_64)
url='https://gitlab.com/Rubo/wio'
license=('BSD-3-Clause')
depends=(alacritty cage cairo "wlroots0.19")
makedepends=(meson wayland-protocols)
source=("$url/-/archive/$pkgver/$_name-$pkgver.tar.gz")
b2sums=('9f850c96f93f1658aaaa5fedd6aeed2e88264ab33314b1a6a1fd82edca1fc006bbb8f48ac9e3c3f95a19c2bf4c674dcdadf240bcc4810c451f269d10959d9098')

build() {
    cd $_name-$pkgver
    arch-meson build
    meson compile -C build
}

package() {
    cd $_name-$pkgver
    meson install -C build --destdir "$pkgdir"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
