# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=diceR
_pkgver=2.1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Diverse Cluster Ensemble in R"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
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
  r-blockcluster
  r-dbscan
  r-e1071
  r-kernlab
  r-kohonen
  r-mixedclust
  r-polca
  r-rtsne
  r-sigclust
  r-testthat
)
optdepends=(
  r-apcluster
  r-covr
  r-dbscan
  r-e1071
  r-kernlab
  r-knitr
  r-kohonen
  r-mixedclust
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
md5sums=('0caa6615fcf2f12cb8675c6e4ba52c62')
sha256sums=('a91e07119ceda74cd9de317354c838a2decb880d42f293afe74af010d2533432')

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
