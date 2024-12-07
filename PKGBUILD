# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=wio
pkgname=$_name-wl
pkgver=0.18.1
pkgrel=2
pkgdesc="Wayland compositor similar to Plan 9's rio"
arch=(x86_64)
url='https://gitlab.com/Rubo/wio'
license=('BSD-3-Clause')
depends=(alacritty cage cairo "wlroots=$pkgver")
makedepends=(meson wayland-protocols)
source=("$url/-/archive/$pkgver/$_name-$pkgver.tar.gz")
b2sums=('53b4a9e29bb6ae71b55427ec226d1b7c9d899c24b3461b27efc54aa49b4979e36ebc9cdfcaa1f9351779eea3e49f7dda9e51e8e709c90ff54e6b3b640594ac38')

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
