# Maintainer: Laurent Carlier <lordheavym@archlinux.org>

pkgname=rasm
pkgver=2.1.7
pkgrel=1
pkgdesc="Powerful Z80 assembler"
url="https://github.com/EdouardBERGE/rasm"
license=('custom')
arch=('x86_64')
makedepends=('upx')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/EdouardBERGE/rasm/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c1a870ee0b55a6c3ae54d46aba82db725100e56741f2da37926ede337a58ad92')

prepare() {
  cd "${pkgname}-${pkgver}"

  sed -i "s#./upx#upx#g" makefile
}

build() {
  cd "${pkgname}-${pkgver}"

  make release
}

check() {
  cd "${pkgname}-${pkgver}"

  ./rasm.exe -autotest
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 rasm.exe "${pkgdir}"/usr/bin/rasm.exe

  install -dm755 "${pkgdir}"/usr/share/licenses/"${pkgname}"/{ZX0-main,libdivsufsort}
  install -m644 ZX0-main/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/ZX0-main/
  install -m644 apultra-master/src/libdivsufsort/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/libdivsufsort/
}
