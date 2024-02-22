# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=diceR
_pkgver=2.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Diverse Cluster Ensemble in R"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-abind
  r-assertthat
  r-clue
  r-clustersim
  r-clv
  r-clvalid
  r-dplyr
  r-ggplot2
  r-infotheo
  r-klar
  r-magrittr
  r-mclust
  r-nmf
  r-purrr
  r-rankaggreg
  r-rcpp
  r-stringr
  r-tidyr
  r-yardstick
)
checkdepends=(
  r-apcluster
  r-dbscan
  r-e1071
  r-kernlab
  r-kohonen
  r-polca
  r-rtsne
  r-sigclust
  r-testthat
)
optdepends=(
  r-apcluster
  r-blockcluster
  r-covr
  r-dbscan
  r-e1071
  r-kernlab
  r-knitr
  r-kohonen
  r-pander
  r-polca
  r-progress
  r-rcolorbrewer
  r-rlang
  r-rmarkdown
  r-rtsne
  r-sigclust
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('129a82879f63326d58087b0cbd5edd27')
b2sums=('4c7ffaa4f226e7b0b1d0ebcceef2d8b68a56baa72e8d46b28335e5a951c73fd574e35d49017f18364c6e9105cd0b10ecf63d0e95586062842791244eaad5622f')

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
