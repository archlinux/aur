# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=netboost
_pkgver=2.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Network Analysis Supported by Boosting"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  bash
  gzip
  make
  onetbb
  perl
  r-biocstyle
  r-colorspace
  r-dynamictreecut
  r-impute
  r-r.utils
  r-rcpp
  r-rcppparallel
  r-wgcna
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-build.patch")
md5sums=('1959c581ce396cf0e494ca7d8a48b0fc'
         '8ec6c48c11194032999b97b498934753')
b2sums=('cf6c8948dd6fbe91d77f62c755a6fb50ac7ef44d36e98b699b6efb684924dffb48d5bc72646d7c7ec395ef7c6ea03f82bdd03d9eb163df149f7d4856380c6a78'
        'e607da2818fcc96d110e579ddbf7ac221aea127fbc730a1d6ac5946d608915fe3ef4af39e7b678a08c165c55d629b44df0147ecf6b758f1ff7a4715421374eab')

prepare() {
  # disable CPU feature detection, fix build flags
  patch -Np1 -i fix-build.patch
  cd "$_pkgname"
  autoconf
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
