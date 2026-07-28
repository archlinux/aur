# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=HERON
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Hierarchical Epitope pROtein biNding"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-data.table
  r-genomicranges
  r-harmonicmeanp
  r-iranges
  r-limma
  r-matrixstats
  r-metap
  r-s4vectors
  r-spdep
  r-summarizedexperiment
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9107147f34c5a5218221b7988582c1c0')
b2sums=('5f34c7d47c46ef16f604ff98f405dd150f46976f79ac2c10e2e661c17a967734edbb78802f15c4a8b28330c4000be12350b39da051698c06708cee3913c403b3')

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
