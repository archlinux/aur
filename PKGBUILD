pkgname="previsat"
pkgver=5.1.3.1
pkgrel=1
pkgdesc="PreviSat is a satellite tracking software for observing purposes."
arch=('i686' 'x86_64')
url="https://previsat.sourceforge.net/"
makedepends=('qt5-multimedia' 'qt5-tools')
license=('GPL3')
source=("${pkgname}-${pkgver}::https://sourceforge.net/projects/previsat/files/previsat/previsat5-1/previsat-5-1-3-1/previsat-5.1.3.1-src.tar.gz/download")
sha256sums=('d83de423ba602bcf821d1b8dfa4df07372fc545bc958fcfefb26d3a01ebb660d')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  lrelease translations/PreviSat_en.ts
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
