# Maintainer: Lev Babiev <harley at hosers dot org>

pkgname=sfwbar
pkgver=0.9.7
pkgrel=1

pkgdesc='Sway Floating Window taskBar'
arch=('x86_64')
url='https://github.com/LBCrion/sfwbar'
license=('GPL3')
depends=(
    'gtk3'
    'libucl-git'
    'gtk-layer-shell'
    )
makedepends=(
    'meson'
    )

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

sha256sums=('f00f31b624af78597f0e6a93bbbeb5b88c6d9c4a604afceed7362f03437e6a38')

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
