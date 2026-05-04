# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=seq.hotSPOT
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Targeted sequencing panel design based on mutation hotspots"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-hash
  r-r.utils
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('36e68cf3d360913af1307b35a19a3fac')
b2sums=('3e6e737156a91255018bf7b90c0effddf0de2f55e2c381b7e853a19c6cd45f0e0d20d6ae7a70103e6653a0cff79163a13fe3e41a7c4768c5d083c2ca3b618981')

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
