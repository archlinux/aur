# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Kibouo <csonka.mihaly@hotmail.com>

_pkgname=hunspell
_pkgver=3.0.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="High-Performance Stemmer, Tokenizer, and Spell Checker"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(LGPL)
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
sha256sums=('fdaa1473a62dff2a5923b9bd958d87e546069ca22ce113f44e88c761338442f3')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
