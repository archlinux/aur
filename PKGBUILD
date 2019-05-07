# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=drminfo
pkgver=7.1
pkgrel=1
pkgdesc="print drm device information"
arch=('i686' 'x86_64')
url="https://www.kraxel.org/cgit/drminfo/"
license=('GPLv2')
source=("https://www.kraxel.org/cgit/drminfo/snapshot/drminfo-${pkgver/./-}.tar.gz")
sha256sums=('b9af9f5f3d86e04a36c57a2c14b903b490a9f36f3eda22c08375c5870dabb8cb')
depends=('libdrm' 'mesa' 'libepoxy' 'cairo' 'pixman' 'gtk3')
makedepends=('meson')
checkdepends=('python-avocado')

prepare() {
  cd drminfo-${pkgver/./-}
  rm -rf build
  meson build --prefix='/usr'
}

build() {
  cd drminfo-${pkgver/./-}
  ninja -C build
}

check() {
  cd drminfo-${pkgver/./-}/tests
  avocado run *.py
}

package() {
  cd drminfo-${pkgver/./-}
  DESTDIR="${pkgdir}" ninja -C build install
}
