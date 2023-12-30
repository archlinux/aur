# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=wio
pkgname=$_name-wl
pkgver=0.17.1
pkgrel=1
pkgdesc="Wayland compositor similar to Plan 9's rio"
arch=(x86_64)
url='https://gitlab.com/Rubo/wio'
license=('custom')
depends=(alacritty cage cairo "wlroots>=$pkgver")
makedepends=(meson)
source=("$url/-/archive/$pkgver/$_name-$pkgver.tar.gz")
b2sums=('f81d67fa9fe50ff4bc087db076c06cd33237495ffd403978dbaba85e032f36803e4ee734687db668aeea46c5e3d1b344814fed80b12c24a4b64cbe3f3e4f14cb')

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
