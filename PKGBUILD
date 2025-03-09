# Maintainer: Dringsim <dringsim@qq.com>

_cranname=rolog
_cranver=0.9.20
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Query SWI-Prolog from R"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('BSD')
depends=('r-rcpp' 'swi-prolog')
makedepends=()
optdepends=('r-rmarkdown'
	'r-knitr'
	'r-diagrammer'
	'r-diagrammersvg'
	'r-rsvg'
	'r-htmltools'
	'r-testthat')
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('5D85227972C7D682407FADCBECF0AF25589A779BAD490A6BA9C8282144E17E5E')

prepare() {
  sed -i 's/LinkingTo: Rcpp, rswipl/LinkingTo: Rcpp/' ./${_cranname}/DESCRIPTION
  tar -zcvf ${_cranname}_${_cranver}-patched.tar.gz ./${_cranname}
}

build() {
  unset SWI_HOME_DIR
  R CMD INSTALL ${_cranname}_${_cranver}-patched.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
sha256sums=('b44085e96dae887cba15293b5275c2ab8999379d0e50da1efc66b0106ba7da34')
