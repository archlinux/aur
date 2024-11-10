# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=PSMatch
_pkgver=1.10.0
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
  r-spectra
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cf954495b58b7d4bb5af2b1f09f7f572')
b2sums=('567505922597d28f624a25a6d4af5e74e0928e526e0bcac605253eca7db8cb9f28b70a2b55bb4ceb67b0beefd08e3ef39effb899c865829036f66d2aa27f2962')

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
