# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bayesm
_pkgver=3.1-6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Bayesian Inference for Marketing/Micro-Econometrics"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  blas
  lapack
  r-rcpp
)
makedepends=(
  r-rcpparmadillo
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3ce1e250505c319ef9b0b9b113cfead8')
sha256sums=('17d72b9cdc090845f98e7a04640380d0baef8bc23d1487c8f64dc192fdb93cb5')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
