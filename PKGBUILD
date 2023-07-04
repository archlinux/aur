# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=distributions3
_pkgver=0.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Probability Distributions as S3 Objects"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
depends=(
  r-ellipsis
  r-ggplot2
  r-glue
)
checkdepends=(
  r-revdbayes
  r-testthat
)
optdepends=(
  r-covr
  r-cowplot
  r-knitr
  r-revdbayes
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('de2560c8cfa8a5ffa9ee9e0bcd7f745a')
sha256sums=('0651dc32be8c4a016344cfe5c3aab5c0fb2d424acd1e1600ddf063a871d188a5')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
