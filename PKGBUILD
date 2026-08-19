# Maintainer: Laurent Carlier <lordheavym@archlinux.org>

pkgname=rasm
pkgver=3.2.6
pkgrel=1
pkgdesc="Powerful Z80 assembler"
url="https://github.com/EdouardBERGE/rasm"
license=('custom')
arch=('x86_64')
makedepends=('upx')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/EdouardBERGE/rasm/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6fe0ef9ef3a448bd8e2b5755e8696944960deb40e718a4f6beb3993458e7ae0f')

prepare() {
  cd "${pkgname}-${pkgver}"

  sed -i "s#./upx#upx#g" makefile
}

build() {
  cd "${pkgname}-${pkgver}"

  make release
}

# check() {
#   cd "${pkgname}-${pkgver}"bis
#
#   ./rasm.exe -autotest
# }

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 rasm.exe "${pkgdir}"/usr/bin/rasm.exe

  install -dm755 "${pkgdir}"/usr/share/licenses/"${pkgname}"/libdivsufsort
  install -m644 apultra-master/src/libdivsufsort/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/libdivsufsort/
}
