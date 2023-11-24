# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gg4way
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="4way Plots of Differential Expression"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
depends=(
  r-deseq2
  r-dplyr
  r-edger
  r-ggplot2
  r-ggrepel
  r-glue
  r-janitor
  r-limma
  r-magrittr
  r-purrr
  r-rlang
  r-scales
  r-stringr
  r-tibble
  r-tidyr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-airway
  r-biocstyle
  r-knitr
  r-org.hs.eg.db
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('500552b8ab9c3fc5cc58fcf56378a928')
sha256sums=('cf44e456e5a2be78941dc2cf8b1a918fe4da0246bd285e53d1dc2636bd442af7')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
