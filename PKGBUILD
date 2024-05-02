# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=regionalpcs
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Summarizing Regional Methylation with Regional Principal Components Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-dplyr
  r-genomicranges
  r-pcatools
  r-tibble
)
checkdepends=(
  r-rmtstat
  r-testthat
)
optdepends=(
  r-biocstyle
  r-iranges
  r-knitr
  r-minfidata
  r-rmarkdown
  r-rmtstat
  r-testthat
  r-tidyr
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b908a64d856ff84a37e3ee9fdceb17e2')
b2sums=('6fca5d255a9d6a204e55b695032ccc9b51924ff33c402818033d42f5861ac4553fba2a2a8e203401190c8e93818d10ae0b3b9c653b1e0a616b1a15bb18f8b1ff')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
