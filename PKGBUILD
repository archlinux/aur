# Maintainer: Lev Babiev <harley at hosers dot org>

pkgname=sfwbar
pkgver=0.9.4
pkgrel=1

pkgdesc='Sway Floating Window taskBar'
arch=('x86_64')
url='https://github.com/LBCrion/sfwbar'
license=('GPL3')
depends=(
    'gtk3'
    'json-c'
    'gtk-layer-shell'
    )
makedepends=(
    'meson'
    )

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

sha256sums=('66c4a824c917759a8f165ebf17b4395b39c39b2e931343d2e072910d13117744')

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
