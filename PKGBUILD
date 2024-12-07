# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=wio
pkgname=$_name-wl
pkgver=0.18.1
pkgrel=1
pkgdesc="Wayland compositor similar to Plan 9's rio"
arch=(x86_64)
url='https://gitlab.com/Rubo/wio'
license=('BSD-3-Clause')
depends=(alacritty cage cairo "wlroots=$pkgver")
makedepends=(meson wayland-protocols)
source=("$url/-/archive/$pkgver/$_name-$pkgver.tar.gz")
b2sums=('64e6ba16521e05f279206aecda186b944a4ee9623b0d42625756a57ac38dcf3332a2dc4505a247218d19a4fe9f519502ad3c8808ac29665104754745bb259cf3')

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
