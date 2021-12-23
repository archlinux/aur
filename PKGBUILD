# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=drminfo
pkgver=8.1
pkgrel=1
pkgdesc="print drm device information"
arch=('i686' 'x86_64')
url="https://www.kraxel.org/cgit/drminfo/"
license=('GPLv2')
source=("https://www.kraxel.org/cgit/drminfo/snapshot/drminfo-${pkgver/./-}.tar.gz")
sha256sums=('0d6b182e63cb4a47a9dcddb0402aa8aa58c93e0aaaf8bc2f1cec8c98a9bdd3be')
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
