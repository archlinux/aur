# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=coMethDMR
_pkgver=1.8.0
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
md5sums=('006625b528326e4c948f1a4daac9621f')
b2sums=('9a5945272f388d6c39207e49ee44ec3d64bd9cc46e42518048a894f06f17b2b6701b7ef6caedb9732d5b91d2b5e0d78bad3a72fda6c7abb6793fa17b64fbce37')

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
