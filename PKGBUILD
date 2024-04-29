# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=kebabs
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Kernel-Based Analysis Of Biological Sequences"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-apcluster
  r-biostrings
  r-e1071
  r-kernlab
  r-liblinear
  r-rcpp
  r-s4vectors
  r-xvector
)
makedepends=(
  r-iranges
)
optdepends=(
  r-biobase
  r-biocgenerics
  r-knitr
  r-sparsem
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-build.patch")
md5sums=('d6c4a16d9fd157b1e68acc8d4816017e'
         'e2e8f5c5a4eb2e21ef973f32c2ed0c1a')
b2sums=('1a30610c1c4d82b9ef4d5f78b24cd93147f017b510885fbac851db3a0e34af91a7de27f790402ed0f47f3a19895869306bdb98b4b3b2de943162248f547bb5b5'
        '025d0b3f3a6a7433403de4f31591706f0bd4a7a0b65673d6e7907827b3218acfa1636f1203da27cbb4737077b54f7c57bc8b5c6b5204d0fb586a171d5fa4b577')

prepare() {
  # fix format string errors
  patch -Np1 -i fix-build.patch
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
