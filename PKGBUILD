# Maintainer: Lev Babiev <harley at hosers dot org>

pkgname=sfwbar
pkgver=0.9.9.3
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

sha256sums=('62e6926946911d079ae7eebb3d91525cae0b8586c223801afaa106df39df222d')

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
