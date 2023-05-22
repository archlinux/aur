# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=orcaqm
pkgver=5.0.4
_openmpi_ver=4.1.1
pkgrel=1
pkgdesc="Ab initio, DFT, and semi-empirical SCF-MO package"
url="https://orcaforum.kofo.mpg.de/app.php/portal"
license=(custom)
arch=(x86_64)
depends=(openmpi)
makedepends=(xz)
# Due to licensing issues you must register and download the package from the ORCA url and put it in the PKGBUILD folder!
source=("local://orca_${pkgver//./_}_linux_x86-64_shared_openmpi${_openmpi_ver//./}.tar.xz"
        "orcaqm")
noextract=("orca_${pkgver//./_}_linux_x86-64_shared_openmpi${_openmpi_ver//./}.tar.xz")
sha1sums=('acadf007856a774439ee2c572d02671a317576ef'
          'dd42dc249e1327cf99cd09dc1cda459a6fc48df6')
options=(staticlibs !strip)

PKGEXT='.pkg.tar'

package() {
  # create necessary directories
  mkdir -p ${pkgdir}/opt/orca

  # install stuff in place
  tar -xJf ${srcdir}/orca_${pkgver//./_}_linux_x86-64_shared_openmpi${_openmpi_ver//./}.tar.xz --strip 1 -C ${pkgdir}/opt/orca
  install -Dm755 ${srcdir}/orcaqm ${pkgdir}/usr/bin/orcaqm
}
