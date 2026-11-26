# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=plyxp
_pkgver=1.8.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data masks for SummarizedExperiment enabling dplyr-like manipulation"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biocgenerics
  r-cli
  r-dplyr
  r-glue
  r-iranges
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
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('35670b5eefe2d7983155c01064394fca')
b2sums=('3ee9516783cdfec62754fe6340c125b37dc38189716abf984e15a6b02b0db882bfe3e0dad88164b1539d02108a5a62a799686468ee7998585ca0bda63fc77d0b')

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
