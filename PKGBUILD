# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=drminfo
pkgver=5.1
pkgrel=1
pkgdesc="print drm device information"
arch=('i686' 'x86_64')
url="https://www.kraxel.org/cgit/drminfo/"
license=('GPLv2')
source=("https://www.kraxel.org/cgit/drminfo/snapshot/drminfo-${pkgver/./-}.tar.gz")
sha256sums=('e3a5db6ccf22e9198e63b5a4f5268b7bc17169ae8e0056673c8760b3d2a7c9a1')
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
