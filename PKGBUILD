# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=waddR
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Statistical tests for detecting differential distributions based on the 2-Wasserstein distance"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-arm
  r-biocfilecache
  r-biocparallel
  r-eva
  r-rcpp
  r-singlecellexperiment
)
makedepends=(
  r-rcpparmadillo
)
optdepends=(
  r-devtools
  r-knitr
  r-rmarkdown
  r-roxygen2
  r-rprojroot
  r-scater
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3bb00eacd4724bb28f8e73592e5daf3a')
b2sums=('50909e6b60f5813a229af4bdacd3faf1a301c97db54daca23ff6e1ab53ef79dd9b2fab9c259d84c8b38573753ef822bb006e2a2e56835617981c8e698230f723')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
