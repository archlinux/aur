# system requirements: V8 engine version 6+ is needed for ES6 and WASMsupport. On Linux you can also build against libv8-dev (Debian)or v8-devel (Fedora). We also provide static libv8 binaries formost platforms, see the README for details.
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=V8
_pkgver=4.2.0
pkgname=r-${_pkgname,,}
pkgver=4.2.0
pkgrel=3
pkgdesc='Embedded JavaScript and WebAssembly Engine for R'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-curl
  r-jsonlite
  r-rcpp
  v8
  make
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6c62fdc974cc30fa975cad4ccb1e3796112fc2490a807f6e3d7878c3a5544743')
options=(staticlibs)
build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
