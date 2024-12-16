# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=wio
pkgname=$_name-wl
pkgver=0.18.2
pkgrel=1
pkgdesc="Wayland compositor similar to Plan 9's rio"
arch=(x86_64)
url='https://gitlab.com/Rubo/wio'
license=('BSD-3-Clause')
depends=(alacritty cage cairo "wlroots=$pkgver")
makedepends=(meson wayland-protocols)
source=("$url/-/archive/$pkgver/$_name-$pkgver.tar.gz")
b2sums=('ff1bdcacc2713a218ccb01c9dc144b0ebf351acd903a9c039cb06753ca073c7e4edb1b121cd705a3465fa7d1064333eafbb2ac0a28d1e0015120090168ea64f2')

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
