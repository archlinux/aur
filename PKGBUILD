# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=PSMatch
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Handling and Managing Peptide Spectrum Matches"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocgenerics
  r-biocparallel
  r-igraph
  r-mscoreutils
  r-protgenerics
  r-qfeatures
  r-s4vectors
  r-spectra
  r-iranges
)
checkdepends=(
  r-msdata
  r-mzid
  r-mzr
  r-spectra
  r-testthat
)
optdepends=(
  r-biocstyle
  r-factoextra
  r-knitr
  r-msdata
  r-mzid
  r-mzr
  r-rmarkdown
  r-rpx
  r-vdiffr
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5fc6c85bbcf8e253a156b84c168c96b7')
b2sums=('26b1275c7da6c26aee5e22046b88ea8cb9ab36a45567dfc6bfdc84db67ad75acc98fff41ac08d519c6821fed1cae252e2cb8ef5e8318b7b63dbe42c95f2aac19')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

_check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
