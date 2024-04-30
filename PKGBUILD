# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=wio
pkgname=$_name-wl
pkgver=0.17.3
pkgrel=1
pkgdesc="Wayland compositor similar to Plan 9's rio"
arch=(x86_64)
url='https://gitlab.com/Rubo/wio'
license=('custom')
depends=(alacritty cage cairo "wlroots>=$pkgver")
makedepends=(meson)
source=("$url/-/archive/$pkgver/$_name-$pkgver.tar.gz")
b2sums=('ef81eb9ade02a055a965591b218be6ff8bbed3ad5f88295c71ecc18de1cefe9d603a7500389f44757acdb795c348601786b955b8a7bcf0ef00b05c3fbed6337c')

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
