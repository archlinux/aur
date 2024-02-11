# Maintainer: René Wagner <rwa@clttr.info>
# Contributor: Andrew Sun <adsun701@gmail.com>

pkgname=ctl
pkgver=1.5.3
pkgrel=1
pkgdesc="The Color Transformation Language"
arch=('x86_64')
url="https://github.com/ampas/CTL"
license=('custom')
depends=('openexr' 'libtiff' 'aces-container')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ampas/CTL/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0a9f5f3de8964ac5cca31597aca74bf915a3d8214e3276fdcb52c80ad25b0096')

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
