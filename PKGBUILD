# Maintainer: Laurent Carlier <lordheavym@archlinux.org>

pkgname=rasm
pkgver=3.0.9
pkgrel=1
pkgdesc="Powerful Z80 assembler"
url="https://github.com/EdouardBERGE/rasm"
license=('custom')
arch=('x86_64')
makedepends=('upx')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/EdouardBERGE/rasm/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('919016fc90d080605f82fddee50ac30f3e9c0d5a2bf73575ca70e9667cb6fe8f')

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

  install -dm755 "${pkgdir}"/usr/share/licenses/"${pkgname}"/libdivsufsort
  install -m644 apultra-master/src/libdivsufsort/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/libdivsufsort/
}
