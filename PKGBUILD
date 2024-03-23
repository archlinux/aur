# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=wio
pkgname=$_name-wl
pkgver=0.17.2
pkgrel=1
pkgdesc="Wayland compositor similar to Plan 9's rio"
arch=(x86_64)
url='https://gitlab.com/Rubo/wio'
license=('custom')
depends=(alacritty cage cairo "wlroots>=$pkgver")
makedepends=(meson)
source=("$url/-/archive/$pkgver/$_name-$pkgver.tar.gz")
b2sums=('54db114accc6c7f3999ce657843f8161d685d900f3970efb6cfd5a3035d2a10320e194078e4397f882dd6f9bd1a6f7c84fafb7c854b154db9d090307b1bde066')

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
