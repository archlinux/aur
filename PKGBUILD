# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Alex Branham <branham@utexas.edu>

_pkgname=recipes
_pkgver=1.3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Preprocessing and Feature Engineering Steps for Modeling"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-cli
  r-clock
  r-dplyr
  r-generics
  r-glue
  r-gower
  r-hardhat
  r-ipred
  r-lifecycle
  r-lubridate
  r-magrittr
  r-purrr
  r-rlang
  r-tibble
  r-tidyr
  r-tidyselect
  r-timedate
  r-vctrs
  r-withr
  r-sparsevctrs
)
checkdepends=(
  r-ddalpha
  r-dials
  r-dimred
  r-fastica
  r-igraph
  r-kernlab
  r-mixomics
  r-modeldata
  r-rann
  r-rcppml
  r-rcpproll
  r-rsample
  r-rspectra
  r-splines2
  r-testthat
)
optdepends=(
  r-covr
  r-ddalpha
  r-dials
  r-ggplot2
  r-igraph
  r-kernlab
  r-knitr
  r-modeldata
  r-parsnip
  r-rann
  r-rcpproll
  r-rmarkdown
  r-rsample
  r-rspectra
  r-splines2
  r-testthat
  r-workflows
  r-xml2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d35db42364aabb4cdeb02b958fae4b87')
b2sums=('946cafc171b350dd44851aca621e91486a2d3283e8c02d5883f8224e3ab2d4f3faf96e1934d1ac4f647daef78ec1751c0b084c78f791c4cfebc34533f2feae90')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
