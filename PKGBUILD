# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=PanomiR
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('8ec501eec03c85a8bd7aafd1cb4af9e2')
b2sums=('abd9bd0097f84ee03db76e171b9c364d76e773b74e179378e0b01e66356aaa44358e24a35dc1d41ff4d2193b8aeb8f656cff22e93c11b5a475d210e04a60a517')

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
