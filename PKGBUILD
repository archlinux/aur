# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=drminfo
pkgver=6.1
pkgrel=1
pkgdesc="print drm device information"
arch=('i686' 'x86_64')
url="https://www.kraxel.org/cgit/drminfo/"
license=('GPLv2')
source=("https://www.kraxel.org/cgit/drminfo/snapshot/drminfo-${pkgver/./-}.tar.gz")
sha256sums=('70304a49f51c6080d8414f45a69c21eb934732d494ee43b91a80a48ebf8cd18e')
depends=('libdrm' 'mesa' 'libepoxy' 'cairo' 'pixman' 'gtk3')
makedepends=('meson')

prepare() {
  cd drminfo-${pkgver/./-}
  rm -rf build
  meson build --prefix='/usr'
}

build() {
  cd drminfo-${pkgver/./-}
  ninja -C build
}

package() {
  cd drminfo-${pkgver/./-}
  DESTDIR="${pkgdir}" ninja -C build install
}
