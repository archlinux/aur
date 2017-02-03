# Maintainer: gcarq <michael.egger@tsn.at>

pkgname=souman
pkgver=1.0.0
pkgrel=1
pkgdesc="Utility to download and build packages from source using the Arch Build System (ABS)"
arch=('i686' 'x86_64')
url="https://github.com/gcarq/souman"
license=('GPL')
depends=('bash' 'abs')
source=(https://raw.githubusercontent.com/gcarq/souman/$pkgver/souman.sh)
sha256sums=('ce0f53a04ab357119c12dfcedd4e571f35b46c6afeb12d66e970e9e3237b9554')

package() {
  install -D souman.sh "${pkgdir}/usr/bin/souman"

  # make adjustments to script
  sed -i "/VERSION=/s|%%VERSION%%|$pkgver|" "${pkgdir}/usr/bin/souman"
  if [[ $CARCH = "x86_64" ]]; then
    sed -i '/ARCH=/s|i686|x86_64|' "${pkgdir}/usr/bin/souman"
  fi
}
