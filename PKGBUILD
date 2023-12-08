# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=coMethDMR
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Accurate identification of co-methylated and differentially methylated regions in epigenome-wide association studies"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
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
md5sums=('0a6229d90868a4a60eb0f72c4499d1fc')
sha256sums=('a5d26df311e9e10344634d51e8382c5cc2a6cc11a645087fed6ffb880287bade')

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
