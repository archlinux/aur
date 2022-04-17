pkgname=openfpgaloader-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Universal utility for programming FPGA"
arch=('x86_64')
url="https://github.com/trabucayre/openFPGALoader"
license=('Apache2')
depends=('libftdi' 'libftdi-compat' 'hidapi' 'libudev.so')
provides=('openfpgaloader')
conflicts=('openfpgaloader')
source=("$pkgname-$pkgver.tar.gz::https://github.com/trabucayre/openFPGALoader/releases/download/v${pkgver}/ubtuntu18.04-openFPGALoader.tgz")
sha256sums=('7166ed027dd45e43af76c7cc0fb5f7c0d755e63fa97502d90980b9572bdeac83')

prepare() {
  sed -i 's|MODE="664", GROUP="plugdev"|MODE="666"|g' "${srcdir}/etc/udev/rules.d/99-openfpgaloader.rules"
}

package() {
  install -Dm755 "${srcdir}/usr/local/bin/openFPGALoader" "${pkgdir}/usr/bin/openFPGALoader"

  mkdir -p "${pkgdir}/usr/share"
  mv "${srcdir}/usr/local/share/openFPGALoader" "${pkgdir}/usr/share/openFPGALoader"

  install -Dm644 "${srcdir}/etc/udev/rules.d/99-openfpgaloader.rules" "${pkgdir}/usr/lib/udev/rules.d/99-openfpgaloader.rules"
}
