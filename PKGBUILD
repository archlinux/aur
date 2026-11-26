# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=fastreeR
_pkgver=2.4.0
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
md5sums=('bc9fe588a49fd31eb46e9de9ca74798b')
b2sums=('e10309330be348c79d1946778c69364b71e1945415e230dd81041fdd3fb4be97478cb5dacc2f505ce8ea9b84814b24e0b09f9108098b13bca970e2a1cd3f3d55')

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
