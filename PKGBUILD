# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mina
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('d6578736bef864eef8f89958a849137b'
         '752b530f9cac80b22d5672b7f2201186')
b2sums=('ddc134aa09971bbc57385e1a9a482c6fddd54fddf23267726584eccdd187c8e52bb07781618944bb7b91946c9fff578a85684764de6414d585f0284be40c4586'
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
