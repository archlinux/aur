# Maintainer: Posi <posi1981@gmail.com>

# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=bir
pkgver=2.0
pkgrel=1
pkgdesc="Batch image resizer for Linux"
arch=('x86_64')
url='https://github.com/agronick/BIR'
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-base')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/agronick/BIR/archive/${pkgver}.tar.gz")
sha256sums=('e17bd1239343863006fa830bce229046c75512e66d51c529bda00cdf8c76e341')

build() {
  cd "BIR-${pkgver}"
  rm -rf build
  mkdir build
  cd "${srcdir}/BIR-${pkgver}/build"
  qmake PREFIX=/usr ..
  make
}

package() {
  cd "BIR-${pkgver}/build"
  make INSTALL_ROOT="${pkgdir}" install
  install -Dm644 ../bir.png -t "${pkgdir}/usr/share/pixmaps"
  install -Dm644 ../bir.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm644 ../README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
# vim:set ts=2 sw=2 et:
