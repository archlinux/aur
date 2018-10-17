# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>

pkgname=ibsim
pkgver=0.7
pkgrel=3
pkgdesc='OpenFabrics Alliance InfiniBand simulator utilities'
arch=('x86_64' 'i686')
url='https://www.openfabrics.org/index.php/overview.html'
license=('GPL2')
depends=('libibmad' 'bash')
source=("https://www.openfabrics.org/downloads/management/${pkgname}-${pkgver}.tar.gz")
sha256sums=('66908257f0de6866589b6f4b99e9cfd2805d4d3ed61631e09d15eae876202e24')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # ibsim doesn't use configure, just make
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make libpath=/usr/lib DESTDIR="${pkgdir}" install
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
  cp -r net-examples scripts "${pkgdir}/usr/share/doc/${pkgname}"
}
