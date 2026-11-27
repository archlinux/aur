# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ISLET
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Individual-Specific ceLl typE referencing Tool"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-abind
  r-biocgenerics
  r-biocparallel
  r-lme4
  r-nnls
  r-purrr
  r-summarizedexperiment
)
checkdepends=(
  r-runit
)
optdepends=(
  r-biocstyle
  r-dplyr
  r-htmltools
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2d0667873de1ef83341b9c7cb1d58e79')
b2sums=('3d2cd05128f95ce536401e39982c3217d63bf9dea5637c4c7891242a3280e1d980988c248f22d858545403a500639e73ebec98964e66b3e5b5d04bc10dc2ed7c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla runTests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
