# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=stringfish
_pkgver=0.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Alt String Implementation"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  onetbb
  pcre2
  r-rcpp
  r-rcppparallel
  xxhash
)
optdepends=(
  r-dplyr
  r-knitr
  r-qs
  r-rlang
  r-rmarkdown
  r-stringr
  r-usethis
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "system-libs.patch")
md5sums=('5ca337ca8e7eeed112eb342165a93684'
         '685b52efc1bfcd2574e559f9df64560e')
b2sums=('b754f12ae5887ae25fade0c049653f15c61c63ce7b8cdd21323a44a95d59a16baca33cb27ad0b9df9e7d4de15f26b52647621ef79b42ef4b172cb2fea2641621'
        'a56459ada70af48192f87952f0bf3c7badf8f9f0159a9ef1cef6d0c9bb9d1faaaa61d82c4a91b4538cd37b3cbca657ddd744ce910379500a8ed8fca7f7a4fd35')

prepare() {
  # use system xxhash
  patch -Np1 -i system-libs.patch
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
