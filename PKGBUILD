# Maintainer: glatavento <glatavento at outlook dot com>

pkgname=openfpgaloader-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="Universal utility for programming FPGA"
arch=('x86_64')
url="https://github.com/trabucayre/openFPGALoader"
license=('Apache2')
depends=('libftdi' 'hidapi' 'libudev.so')
provides=('openfpgaloader')
conflicts=('openfpgaloader')
source=("$pkgname-$pkgver.tar.gz::https://github.com/trabucayre/openFPGALoader/releases/download/v${pkgver}/ubtuntu22.04-openFPGALoader.tgz")
sha256sums=('e4fbb077d61185c6b06f90c988a6f426eccf4308d8e96dce5d96821f95eabefc')

prepare() {
  sed -i 's|MODE="664", GROUP="plugdev"|MODE="666"|g' "${srcdir}/etc/udev/rules.d/99-openfpgaloader.rules"
}

package() {
  install -Dm755 "${srcdir}/usr/local/bin/openFPGALoader" "${pkgdir}/usr/bin/openFPGALoader"

  mkdir -p "${pkgdir}/usr/share"
  mv "${srcdir}/usr/local/share/openFPGALoader" "${pkgdir}/usr/share/openFPGALoader"

  install -Dm644 "${srcdir}/etc/udev/rules.d/99-openfpgaloader.rules" "${pkgdir}/usr/lib/udev/rules.d/99-openfpgaloader.rules"
}
