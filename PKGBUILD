# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mvnfast
_pkgver=0.2.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fast Multivariate Normal and Student's t Methods"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  blas
  lapack
  r-rcpp
)
makedepends=(
  r-bh
  r-rcpparmadillo
)
optdepends=(
  r-knitr
  r-microbenchmark
  r-mvtnorm
  r-plyr
  r-rhpcblasctl
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7f86b01f428f34145a2fd143b441e9bf')
sha256sums=('8871e0ce54b87afc556fd94ca77c3db72dcbb8c245558287e0fe342e30eec9a0')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
