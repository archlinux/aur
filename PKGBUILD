# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=Rarr
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Read Zarr Files in R"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  blosc
  r-httr
  r-jsonlite
  r-paws.storage
  r-r.utils
  r-stringr
  zstd
)
checkdepends=(
  r-mockery
  r-tinytest
)
optdepends=(
  r-biocstyle
  r-covr
  r-knitr
  r-mockery
  r-tinytest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b4ccf32bada187fdbb1ce37b6c49b23f')
b2sums=('1b13a23377f723ea5d33e2b832edf10b79c92b1a6eca513859b3307b334b5a686bfc64a409a43dececda5840e093facd105b8582310a3c160f87954eccf57112')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla tinytest.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
