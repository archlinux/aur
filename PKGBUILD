# Maintainer: glatavento <glatavento at outlook dot com>

pkgname=openfpgaloader-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Universal utility for programming FPGA"
arch=('x86_64')
url="https://github.com/trabucayre/openFPGALoader"
license=('Apache2')
depends=('libftdi' 'libftdi-compat' 'hidapi' 'libudev.so')
provides=('openfpgaloader')
conflicts=('openfpgaloader')
source=("$pkgname-$pkgver.tar.gz::https://github.com/trabucayre/openFPGALoader/releases/download/v${pkgver}/ubtuntu18.04-openFPGALoader.tgz")
sha256sums=('6593666fbe5b33ca74c7f1ce00c9a1f79adacd50d8c35c4783ce609c5be14b14')

prepare() {
  sed -i 's|MODE="664", GROUP="plugdev"|MODE="666"|g' "${srcdir}/etc/udev/rules.d/99-openfpgaloader.rules"
}

package() {
  install -Dm755 "${srcdir}/usr/local/bin/openFPGALoader" "${pkgdir}/usr/bin/openFPGALoader"

  mkdir -p "${pkgdir}/usr/share"
  mv "${srcdir}/usr/local/share/openFPGALoader" "${pkgdir}/usr/share/openFPGALoader"

  install -Dm644 "${srcdir}/etc/udev/rules.d/99-openfpgaloader.rules" "${pkgdir}/usr/lib/udev/rules.d/99-openfpgaloader.rules"
}
