# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RedisParam
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Provide a 'redis' back-end for BiocParallel"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocparallel
  r-futile.logger
  r-redux
  r-withr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8ba19d6ef0437a763a045b7619d943cb')
b2sums=('4a469bf6ecd33bf0af4aa8f658af88077552a230b5ac8bbeb7c448cdba029fee84ac531bff783324c805e2d756941fc89acda8f127022216f90ba40e836c2c26')

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
