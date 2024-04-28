# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=coMethDMR
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('0a6229d90868a4a60eb0f72c4499d1fc')
b2sums=('b43b978f0621e85d47af43f9c06ff3f94e5f20a71f7866adc8852e30d8adf275926df630485a3f4a21c0f538cab8c9fd8186f3431e063e12ac503fb4510bbc63')

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
