# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Kibouo <csonka.mihaly@hotmail.com>

_pkgname=hunspell
_pkgver=3.0.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="High-Performance Stemmer, Tokenizer, and Spell Checker"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only OR LGPL-2.1-only OR MPL-1.1')
depends=(
  r-digest
  r-rcpp
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-janeaustenr
  r-knitr
  r-pdftools
  r-rmarkdown
  r-spelling
  r-stopwords
  r-testthat
  r-wordcloud2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8bd560b5bc128d9307a3d0e344a6a9b4')
b2sums=('567a527dadfbb8f5d81c00f9cb88469b2418189484e1040c375dc3cd50a92db9a03e899ba2e596c4618c4a7ea86afc10d983cae4bff9f34051d176c1ae0b4d20')

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
