# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=wio
pkgname=$_name-wl
pkgver=0.17.4
pkgrel=2
pkgdesc="Wayland compositor similar to Plan 9's rio"
arch=(x86_64)
url='https://gitlab.com/Rubo/wio'
license=('custom')
depends=(alacritty cage cairo wlroots0.17)
makedepends=(meson wayland-protocols)
source=("$url/-/archive/$pkgver/$_name-$pkgver.tar.gz")
b2sums=('038f337704ab4c65a9c6d4478ea5937b038bf845683112dd018f434d736b6d3e39318a8f1afb459b375111109fe8d0bba9bf8fb500fae39215cb7ab217ddd342')

build() {
    cd $_name-$pkgver
    export PKG_CONFIG_PATH='/usr/lib/wlroots0.17/pkgconfig'
    arch-meson build
    meson compile -C build
}

package() {
    cd $_name-$pkgver
    meson install -C build --destdir "$pkgdir"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
