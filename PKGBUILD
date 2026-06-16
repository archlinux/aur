# Maintainer: Laurent Carlier <lordheavym@archlinux.org>

pkgname=rasm
pkgver=3.2.4
pkgrel=1
pkgdesc="Powerful Z80 assembler"
url="https://github.com/EdouardBERGE/rasm"
license=('custom')
arch=('x86_64')
makedepends=('upx')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/EdouardBERGE/rasm/archive/refs/tags/v${pkgver}bis.tar.gz")
sha256sums=('97082ce5f8dbf514c44573b55236d510238f022f1616ec2f966fee8b32b992a8')

prepare() {
  cd "${pkgname}-${pkgver}"bis

  sed -i "s#./upx#upx#g" makefile
}

build() {
  cd "${pkgname}-${pkgver}"bis

  make release
}

# check() {
#   cd "${pkgname}-${pkgver}"bis
#
#   ./rasm.exe -autotest
# }

package() {
  cd "${pkgname}-${pkgver}"bis

  install -Dm755 rasm.exe "${pkgdir}"/usr/bin/rasm.exe

  install -dm755 "${pkgdir}"/usr/share/licenses/"${pkgname}"/libdivsufsort
  install -m644 apultra-master/src/libdivsufsort/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/libdivsufsort/
}
