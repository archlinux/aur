# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=proActiv
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Estimate Promoter Activity from RNA-Seq data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-annotationdbi
  r-biocparallel
  r-data.table
  r-deseq2
  r-dplyr
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-gplots
  r-iranges
  r-rlang
  r-s4vectors
  r-scales
  r-summarizedexperiment
  r-tibble
  r-txdbmaker
)
optdepends=(
  r-genomeinfodbdata
  r-gridextra
  r-knitr
  r-rmarkdown
  r-rtsne
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('95c51151a664d88bd4b72ce329216219')
b2sums=('ff4290926518b304393e48881c121fe3ad3d151b3e5ce25b21d7efae2ad235ac1bd20b850e8e6eb1d22582b09a8445bbe940a32c1881a813cdb65b7c24f31b59')

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
