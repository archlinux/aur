# Maintainer:  Thomas Weißschuh <thomas t-8ch de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: shamrok <szamrok@gmail.com>

pkgname=kraft
pkgver=0.97
pkgrel=1
pkgdesc="A program suitable for all trades or crafts"
arch=('i686' 'x86_64')
url="http://www.volle-kraft-voraus.de/"
license=('GPL')
depends=('akonadi-contacts' 'ctemplate' 'python-reportlab' 'python-pypdf2')
optdepends=("python-weasyprint: alternative PDF generator")
makedepends=('cmake' 'extra-cmake-modules' 'asciidoctor' 'po4a')
source=(
  "kraft-v${pkgver}::https://github.com/dragotin/kraft/archive/v${pkgver}.tar.gz"
)


prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  for s in "${source[@]}"
  do
          case "$s" in
                  (*.patch)
                          patch -p1 < "${srcdir}/${s}"
          esac
  done

  rm -rf build
  mkdir -p build
  cd build
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake ".." \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make "DESTDIR=${pkgdir}" install
}

sha256sums=('9d16c259e2eb44adfcc0682b0e9a09ad5c9dd249db16f3f56c1fee9236fe9af5')
