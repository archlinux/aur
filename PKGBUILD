# Maintainer: Grey Christoforo <first name at last name dot net>

_cranname=BiocManager
_cranver=1.30.12
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A convenient tool to install and update Bioconductor packages."
arch=(x86_64)
url="https://CRAN.R-project.org/package=BiocManager=${_cranname}"
license=('Artistic2.0')
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
sha256sums=('c36108c1d1f3bee1c7ac513714f0c5a75c8417f39b0d69553583dd00d4b74a30')
noextract=(${pkgname}-${pkgver}.tar.gz)

build() {
  R CMD INSTALL ${pkgname}-${pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
