# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rGADEM
_pkgver=2.54.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="de novo motif discovery"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biostrings
  r-bsgenome
  r-genomicranges
  r-iranges
  r-seqlogo
)
optdepends=(
  r-bsgenome.hsapiens.ucsc.hg19
  r-rtracklayer
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-build.patch")
md5sums=('241489c941f013446526da273d7d6584'
         '70cfeaf0a408374fb80a184522865ff6')
b2sums=('709105d37497294be7c59215c5653ce6ec3edd302dcc38d1fa601ca33ede381fe3fc6afc410a03d7663a888258bb57c451fa40d5e2bd0b1af02a067952191c03'
        '7ddd59889027df17d55b6948170539ba7b62f1780e0e3da65cf96cc4a2337c2796d7c9d5b883c4000ab2e090f92b4fc766e9cc85ccd376ee0b8bef252d24d0b8')

prepare() {
  # fix format string errors
  patch -Np1 -i fix-build.patch
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
