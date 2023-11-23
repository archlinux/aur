# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=wio
pkgname=$_name-wl
pkgver=0.17.0
pkgrel=1
pkgdesc="Wayland compositor similar to Plan 9's rio"
arch=(x86_64)
url='https://gitlab.com/Rubo/wio'
license=('custom')
depends=(alacritty cage cairo "wlroots>=$pkgver")
makedepends=(meson)
source=("$url/-/archive/$pkgver/$_name-$pkgver.tar.gz")
b2sums=('d0ebb5b70264ec3c7d72cfa4f8f8921ea795912cbd2905450f61a91ff47b7ff77b2032c0feeedf494f344e90974a728923b9cdf59f15df5917381e953a3e9849')

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
