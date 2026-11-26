# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mina
_pkgver=1.22.0
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
md5sums=('003362c58ac92befadfcbde7ea2364b0'
         '752b530f9cac80b22d5672b7f2201186')
b2sums=('a2cf82cc41298f8448aa6b703a6e1618429d0e3e47b709f7427ac236f3a7834fc38ab06fcd9f93f905ba88241ccad86ec9633a0df690bcbc3ca3829bbfebba47'
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
