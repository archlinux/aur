# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=proActiv
_pkgver=1.14.0
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
  r-gridextra
  r-knitr
  r-rmarkdown
  r-rtsne
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b41f3047e8eea9f19a7829524e190786')
b2sums=('7d0cef54045b3686fb4a0bca705fba52f2553b7a6704b7f26924c95b3dd5547d414ed5737d52b800a3dba08d8c16e1ea5314a7c1ccff4804c04f4e233e7986e5')

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
