# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=coMethDMR
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Accurate identification of co-methylated and differentially methylated regions in epigenome-wide association studies"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-annotationhub
  r-biocparallel
  r-bumphunter
  r-experimenthub
  r-genomicranges
  r-iranges
  r-lmertest
)
checkdepends=(
  r-illuminahumanmethylation450kanno.ilmn12.hg19
  r-sesamedata
  r-testthat
)
optdepends=(
  r-biocstyle
  r-corrplot
  r-illuminahumanmethylation450kanno.ilmn12.hg19
  r-illuminahumanmethylationepicanno.ilm10b4.hg19
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('10576754f41e3ca13eb173a258fb380c')
b2sums=('7f172ff918684f9e9294868a3f1c546aaddfd401c8171785eb08de1306a78999bedb45b165ecedf3a144236aab2e64981b98df5ce79f8972acc4c913deef8015')

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
