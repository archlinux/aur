# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=rgb2cmyk
pkgver=1.1
pkgrel=1
pkgdesc="GUI to facilitate conversion of an image from RGB to CMYK colorspace"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/jgmdev/rgb2cmyk"
license=('GPL')
depends=('wxwidgets-gtk3' 'colord' 'imagemagick')
makedepends=('ninja' 'meson')
source=("https://github.com/jgmdev/rgb2cmyk/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  meson setup build --prefix /usr
  ninja -j$(nproc) -C build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
}
