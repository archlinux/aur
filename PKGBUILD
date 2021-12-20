# Maintainer: Lev Babiev <harley at hosers dot org>

pkgname=sfwbar
pkgver=1.0_beta1
pkgrel=1

pkgdesc='Sway Floating Window taskBar'
arch=('x86_64')
url='https://github.com/LBCrion/sfwbar'
license=('GPL3')
depends=(
    'wayland'
    'gtk3'
    'json-c'
    'gtk-layer-shell'
    )
makedepends=(
    'meson'
    )

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

sha256sums=('25d0f632211838ae9e2fed13336f908ed46dfd6aacb2da6497c66ea326f35e8c')

build() {
    cd "$pkgname-$pkgver"
    meson --prefix=/usr \
          --buildtype=plain \
          build
    ninja -C build
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" ninja -C build install
}
