# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=PanomiR
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Detection of miRNAs that regulate interacting groups of pathways"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-clusterprofiler
  r-dplyr
  r-forcats
  r-gseabase
  r-igraph
  r-limma
  r-metap
  r-org.hs.eg.db
  r-preprocesscore
  r-rcolorbrewer
  r-rlang
  r-tibble
  r-withr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a8f96cdc267551107e69e8cb260a05c0')
b2sums=('3d51974f50a8785a4f1abd5fad731fcae3e048aac6da149d2176187ca930bcc4e300de3bc1fcd05b870502ad795328d35857c27ef4e119ee3aa3a36b77676c07')

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
