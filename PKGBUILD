# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=proActiv
_pkgver=1.16.0
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
md5sums=('1985887def235d0035fc9334a804e4d6')
b2sums=('643e0ff493ace2647bdde7d76b0fd7c9330e5f3e033977e938e801ae19deaf75504a35a640ef27e7b8b32d96557108df3dbb25f135f3486b56e11589043dd333')

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
