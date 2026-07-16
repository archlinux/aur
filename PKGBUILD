# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=coMethDMR
_pkgver=1.16.0
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
md5sums=('82148930122164508a0e205c21fd5f0a')
b2sums=('9f04400a990875fec5ae58fcb42441fe26f8bdada9e006d2474d8e35ee6015c42361596b9c361ddb669fe6ca3bed5d01dfb019694c2f0c69c6e1b320723616f7')

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
