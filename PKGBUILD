# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mina
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Microbial community dIversity and Network Analysis"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  onetbb
  r-apcluster
  r-biganalytics
  r-bigmemory
  r-foreach
  r-ggplot2
  r-hmisc
  r-mcl
  r-paralleldist
  r-plyr
  r-rcpp
  r-reshape2
  r-rspectra
  r-stringr
)
makedepends=(
  r-rcpparmadillo
  r-rcppparallel
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-libs.patch")
md5sums=('4e48253c8c8f9ff14a2446695ea9f18f'
         '752b530f9cac80b22d5672b7f2201186')
b2sums=('343879f07ec45c6808b9803b50f6b52bd4967515321fc7cd5929dc56c507054707db1ff0cc7672e9341a1b75b4528a00dd154d002b7a06192fed300f0392329c'
        'e37e913552183c29e76c3167a23779d5894366f66a415861f2d41381bacfbe07fb277002f9d893e0aba77c2ecb913305a035020a2c792073853160e7b2a33b0d')

prepare() {
  # fix linking with r-rcppparallel
  patch -Np1 -i fix-libs.patch
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
