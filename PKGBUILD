# Maintainer: Kristian Niemi <kristian.niemi@gmail.com>
_cranname=bsicons
_cranver=0.1.2
pkgname=r-${_cranname,,}
pkgver=${_cranver//-/.}
pkgrel=1
pkgdesc="Easily Work with 'Bootstrap' Icons"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=(
  r
  r-cli
  r-htmltools
  r-rlang
)
optdepends=(
  r-bslib
  r-processx
  r-testthat
  r-webshot2
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=('62d5b626d3a5056e46e372c8b65900b74651a6ccdb4e0d2dbca3ec984e146319a56bf06a4049133a6e84e61c8e1b20de2d85e9bde84ae6b2b4e59fae94d2076f')

build() {
  mkdir -p "${srcdir}/build"
  R CMD INSTALL "${_cranname}_${_cranver}.tar.gz" -l "${srcdir}/build"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${srcdir}/build/${_cranname}" "${pkgdir}/usr/lib/R/library"
  if [[ -f "${srcdir}/build/${_cranname}/LICENSE" ]]; then
    install -Dm0644 "${srcdir}/build/${_cranname}/LICENSE" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
