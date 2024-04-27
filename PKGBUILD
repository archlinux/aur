# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=EDIRquery
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Query the EDIR Database For Specific Gene"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-genomicranges
  r-interactionset
  r-readr
  r-tibble
  r-tictoc
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ff19937af17cf0a7a874b986192d6b1c')
b2sums=('287aa14cb3be96b3f1f68b16295ce97c40bdaae456091dff4fc38c78391af8f32ebf0e87f09d33182f7f7d1913de968eb680bd53c63d19412fa85a8ea711f8f3')

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
