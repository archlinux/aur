# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2017-01-30.

_pkgname=naturalearth-data-vector-all
pkgname="${_pkgname}-latest"
epoch=0
_pkgver=latest
pkgver=5.1.2
pkgrel=1
pkgdesc="A public domain map dataset, tightly integrated vector and raster data, to make a variety of maps with cartography or GIS software.
This package provides the cultural and physical data in 1:10mio, 1:50mio and 1:110mio scale.
WARNING: About 1 GiB big."
arch=(any)
url="http://www.naturalearthdata.com/"
license=('custom:public domain')

groups=(
        "naturalearth"
        "naturalearth-data"
       )

depends=(
        )

makedepends=(
)

optdepends=(
            "naturalearth-data-raster: For complimentary raster rendering of earth surface."
           )

provides=(
  "${_pkgname}=${pkgver}"
  "naturalearth-data-vector-cultural-10m=${pkgver}"
  "naturalearth-data-vector-cultural-50m=${pkgver}"
  "naturalearth-data-vector-cultural-110m=${pkgver}"
  "naturalearth-data-vector-physical-10m=${pkgver}"
  "naturalearth-data-vector-physical-50m=${pkgver}"
  "naturalearth-data-vector-physical-110m=${pkgver}"
  "naturalearth-data-vector-cultural=${pkgver}"
  "naturalearth-data-vector-physical=${pkgver}"
  "naturalearth-data-vector=${pkgver}"
  "naturalearth-data=${pkgver}"
)

conflicts=(
  "${_pkgname}"
  "naturalearth-data-vector-cultural-10m"
  "naturalearth-data-vector-cultural-50m"
  "naturalearth-data-vector-cultural-110m"
  "naturalearth-data-vector-physical-10m"
  "naturalearth-data-vector-physical-50m"
  "naturalearth-data-vector-physical-110m"
  "naturalearth-data-vector-cultural"
  "naturalearth-data-vector-physical"
  "naturalearth-data-vector"
)

source=(
  "natural_earth_vector_all.zip::http://naciscdn.org/naturalearth/packages/natural_earth_vector.zip"
  "LICENSE.html::http://www.naturalearthdata.com/about/terms-of-use/"
  'public_domain.txt'
)

sha256sums=(
  'SKIP'
  'SKIP'
  '718babc7ca208819649828125942f68807006c9307205c0f041de9d7a7e927a0'
)

pkgver() {
  cat "${srcdir}/VERSION" | tr -d '[[:space:]]\n'
}

package() {
  _instdirbase='/opt/naturalearth-data'
  _instdir="${pkgdir}/${_instdirbase}"
  _docdirbase="/usr/share/doc/${_pkgname}"
  _docdir="${pkgdir}/${_docdirbase}"

  install -v -d -m755 "${_instdir}"
  cp -rv "${srcdir}"/{10m,50m,110m}_{cultural,physical} "${_instdir}/"

  install -v -d -m755 "${_instdir}/meta-vector"
  cp -rv "${srcdir}"/{housekeeping,tools} "${_instdir}/meta-vector"

  install -v -d -m755 "${_docdir}"
  echo "${url}" > "${_docdir}/info.url"
  chmod 644 "${_docdir}/info.url"
  install -v -m 644 "${srcdir}"/{CHANGELOG,README.md,VERSION} "${_docdir}/"

  install -v -D -m644 "${srcdir}/public_domain.txt" "${pkgdir}/usr/share/licenses/${pkgname}/public_domain.txt"
  install -v -D -m644 "${srcdir}/LICENSE.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}
