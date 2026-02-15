# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: neodarz <neodarz@neodarz.net>

_Name="TerminalImageViewer"
pkgname="${_Name,,}"
pkgver=1.2.1
pkgrel=3
pkgdesc="Display images in a (modern) terminal using RGB ANSI codes and unicode graphic blocks"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'powerpc64le'
  'riscv64'
  'x86_64'
)
url="https://github.com/stefanhaustein/${_Name}"
license=(
  'Apache-2.0 OR GPL-3.0-or-later'
)
depends=(
  'glibc'
  'imagemagick'
  'libgcc'
  'libstdc++'
)
# makedepends=(
#   'cimg'
# )
provides=(
  "tiv=${pkgver}"
)
conflicts=(
  "tiv"
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
sha256sums=('08d0c30e3ffa47b69d1bce07bea56f04b7deb4a8a79307ce435a4f0852fbcd5f')

# prepare() {
#   cd "${srcdir}/${_pkgsrc}/src"
#   sed -e 's/"CImg.h"/<CImg.h>/g' \
#       -i 'tiv.cpp'
#   sed -e 's/CImg.h//g' \
#       -i 'Makefile'
# }

build() {
  cd "${srcdir}/${_pkgsrc}/src"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "src"
  make install DESTDIR="${pkgdir}" prefix='/usr'
}
