pkgname="previsat"
pkgver=6.0.1.2
pkgrel=1
pkgdesc="PreviSat is a satellite tracking software for observing purposes."
arch=('i686' 'x86_64')
url="https://previsat.sourceforge.net/"
makedepends=('qt6-multimedia' 'qt6-tools')
license=('GPL3')
source=("${pkgname}-${pkgver}-src.tar.gz::https://sourceforge.net/projects/previsat/files/previsat/previsat6-0/previsat-${pkgver//./-}/previsat-${pkgver}-src.tar.gz/download")
sha256sums=('781e67060ee9bef3e59396c9ebe33cc1eb6d9510c68ea33a7e8c1e4c5e57340d')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  qmake -config release
  make
}

package() {
  mkdir -p "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/opt/${pkgname}/translations"

  cd "${srcdir}/${pkgname}-${pkgver}/release/"
  cp -r * "${pkgdir}/opt/${pkgname}"

  cd "${srcdir}/${pkgname}-${pkgver}"
  cp -r "data" "${pkgdir}/opt/${pkgname}"
  cp "translations/PreviSat_en.qm" "${pkgdir}/opt/${pkgname}/translations"
}
