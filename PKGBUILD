# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=mosdef
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="MOSt frequently used and useful Differential Expression Functions"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-annotationdbi
  r-clusterprofiler
  r-deseq2
  r-dt
  r-ggforce
  r-ggplot2
  r-ggrepel
  r-go.db
  r-goseq
  r-htmltools
  r-rcolorbrewer
  r-rlang
  r-s4vectors
  r-scales
  r-summarizedexperiment
  r-topgo
)
optdepends=(
  r-biocstyle
  r-genetonic
  r-knitr
  r-macrophage
  r-org.hs.eg.db
  r-rmarkdown
  r-testthat
  r-txdb.hsapiens.ucsc.hg38.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('52379b66b0fbf27d9f5228c0ecadd8c8')
b2sums=('d9b0fbbc4ff96d926be47f466086745db08a3ff14e7b806064bf44e249a5e65745ac1aaa6ba974c610539845c5261c86f9a5893892447db6b895a7be8ac6d026')

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
