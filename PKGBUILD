# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDR
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Umbrella package for R packages in the gDR suite"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-gdrcore
  r-gdrimport
  r-gdrutils
)
checkdepends=(
  r-gdrtestdata
  r-testthat
)
optdepends=(
  r-biocstyle
  r-bumpymatrix
  r-futile.logger
  r-gdrstyle
  r-gdrtestdata
  r-kableextra
  r-knitr
  r-markdown
  r-purrr
  r-rmarkdown
  r-summarizedexperiment
  r-testthat
  r-yaml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d3dcce83808f36f138e3632c90c43b89')
b2sums=('4a2132cd3bde753a2de49bf2e5433dd4c2b947c68b66b455a14f95bc378ef7519d17701602dfe1e05bb67cf7168fee6c8636cc65dfd775f78a3d5234adb2ce79')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
