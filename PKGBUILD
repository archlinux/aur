# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=regionalpcs
_pkgver=1.4.0
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
md5sums=('5bd633cf37f4f1e6510e072d95229143')
b2sums=('78b53c84ec2a6cd37d02f58c346a7f78b13c0b38f70c9872be7126eaf414b701058a7f91d067bba93c4d4744c00249241992f29b999c6b7a74dd484c9cecc8ba')

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
