# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rslurm
_pkgver=0.6.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Submit R Calculations to a 'Slurm' Cluster"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-whisker
)
optdepends=(
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e4d9a59160b587558895573d0ad56319')
b2sums=('506cf5470ff79fa50d419f8445fe97b5e3da33813a4e813100eedb32ba77ee7af712998d64fe54d5deea84d7a44dfcdcd65ef1643f805c4188dbc788b2c5ed67')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
