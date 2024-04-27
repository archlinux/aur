# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=phantasusLite
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Loading and annotation RNA-Seq counts matrices"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biobase
  r-data.table
  r-httr
  r-rhdf5client
  r-stringr
)
checkdepends=(
  r-geoquery
  r-testthat
)
optdepends=(
  r-biocstyle
  r-geoquery
  r-knitr
  r-rhdf5
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5fe0e101ac53a89dd49e077d5fb4c07d')
b2sums=('c28a7ab9128ccff247761208e759b9c462e08cbb2e50d3057fe1e0e2aa2a801260dfc4ddb31be6fc9f1ea295b91f423ead3365064d6296aeaad2c5c16666394c')

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
