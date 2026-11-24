# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=maaslin3
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc='"Refining and extending generalized multivariate linear models for meta-omic association discovery"'
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biocgenerics
  r-collapse
  r-data.table
  r-ggnewscale
  r-ggplot2
  r-lme4
  r-lmertest
  r-logging
  r-mirai
  r-multcomp
  r-optparse
  r-patchwork
  r-rcolorbrewer
  r-reformulas
  r-rlang
  r-scales
)
optdepends=(
  r-dplyr
  r-kableextra
  r-knitr
  r-markdown
  r-rmarkdown
  r-summarizedexperiment
  r-testthat
  r-treesummarizedexperiment
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f7f84edfa8070976c84e45fbbfc88a5a')
b2sums=('249026768a4ebf6fc52e4809dadb1ec767d7a0479c12f533ac59e05934e20a0c1d2ae238095c7866736dce1075fb70fafe8f2d2303279f34c8cccd747b7da029')

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
