# Maintainer: peippo <christoph+aur@christophfink.com>
# Maintainer: Grey Christoforo <first name at last name dot net>

_cranname=BiocManager
_cranver=1.30.17
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A convenient tool to install and update Bioconductor packages."
arch=(x86_64)
url="https://CRAN.R-project.org/package=${_cranname}"
license=("Artistic2.0")
depends=(
r
r-remotes
r-testthat
r-withr
r-curl
)
optdepends=(
r-biocversion
r-rmarkdown
r-knitr
)
source=("${pkgname}-${pkgver}.tar.gz::https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=("25638d92687d303d762088797e061915694a887fce3acee22094675d5455acea")
noextract=(${pkgname}-${pkgver}.tar.gz)

build() {
  R CMD INSTALL ${pkgname}-${pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
