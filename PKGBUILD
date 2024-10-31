# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mina
_pkgver=1.14.0
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
md5sums=('7dc755ac67f493187d858b9e27f43882'
         '752b530f9cac80b22d5672b7f2201186')
b2sums=('022c4a19d38fea8c612d89bb61d86f29f0fb63887bd76cfcddf056bff252a663c39410475f3b09fe35bb7bfed7b13c140e65c74422ec24ed1207336d2cc19953'
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
