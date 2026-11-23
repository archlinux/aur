# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=fastreeR
_pkgver=2.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Phylogenetic, Distance and Other Calculations on VCF and Fasta Files"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-ape
  r-data.table
  r-dynamictreecut
  r-r.utils
  r-rjava
  r-stringr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocfilecache
  r-biocstyle
  r-ggtree
  r-knitr
  r-memuse
  r-rmarkdown
  r-spelling
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dd1584a4aad077a520d8f0d1578a1ea2')
b2sums=('0446153a4e619c482ccc164982fafd5da3d11189f4a62a2fe1d0a8b0dc134852a8cdd623c61a73fe9c7038c2784faef0b53f5f248330f443bb886d5ea1067140')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
