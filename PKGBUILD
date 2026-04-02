# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=stringfish
_pkgver=0.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
  r-rlang
  r-rmarkdown
  r-stringr
  r-qs2
  r-usethis
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "system-libs.patch")
md5sums=('37ed347b3ca5fd30f86b5d8178ef4366'
         '685b52efc1bfcd2574e559f9df64560e')
b2sums=('1cd0b274b0ca4eae65e9f9be9bda8096aedc0eec8ec07731f223f1a114648f388218a1b955879e567a24327cf8bc7e1267b1f1105607e4c5aeef6852006f9973'
        'a56459ada70af48192f87952f0bf3c7badf8f9f0159a9ef1cef6d0c9bb9d1faaaa61d82c4a91b4538cd37b3cbca657ddd744ce910379500a8ed8fca7f7a4fd35')

# prepare() {
#   # use system xxhash
#   patch -Np1 -i system-libs.patch
# }

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
