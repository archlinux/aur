# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=plyxp
_pkgver=1.6.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Data masks for SummarizedExperiment enabling dplyr-like manipulation"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-cli
  r-dplyr
  r-glue
  r-pillar
  r-purrr
  r-rlang
  r-s4vectors
  r-s7
  r-summarizedexperiment
  r-tibble
  r-tidyr
  r-tidyselect
  r-vctrs
)
optdepends=(
  r-airway
  r-devtools
  r-here
  r-iranges
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5d09a94e3071487e520ce782f1924095')
b2sums=('effdb898295d9d1e2bd3468bb932a8aa3a1d4474f97d1225dcc125eb286b4a1598b1aa96b08826897b318009d67ba5d25c30fe9840973b9c9e1fb7f90be9d80f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
