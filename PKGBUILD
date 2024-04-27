# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=waddR
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('97a692c918d531e3d872dc17141cd112')
b2sums=('ffe2398d601073c038c4d1b7b6d38bdff4e4636ce87068c97460ec412c031693c50b3a0d2406ba7ee4705e70ade4e7281554bbe8572c9a10225c4d7ce3cae41a')

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
