# Maintainer: René Wagner <rwa@clttr.info>
# Contributor: Andrew Sun <adsun701@gmail.com>

pkgname=ctl
pkgver=1.5.4
pkgrel=1
pkgdesc="The Color Transformation Language"
arch=('x86_64')
url="https://github.com/ampas/CTL"
license=('AMPAS')
options=(!lto !debug)
depends=('openexr' 'libtiff' 'aces-container')
makedepends=('cmake' 'gcc' 'make')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ampas/CTL/archive/${pkgname}-${pkgver}.tar.gz")

build() {
  mkdir -p "${srcdir}/build" && cd "${srcdir}/build"
  cmake "../CTL-${pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
  
  # License file
  install -Dm644 "${srcdir}/CTL-${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # Remove docs
  rm -rf "${pkgdir}/usr/doc"
}
sha256sums=('fb84925320d053827fce965d7aeea5bb8690d7093bb083c8e3915d7a600e25fc')
