# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rGADEM
_pkgver=2.55.0
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
md5sums=('559bc8c7899d2ab42685c6463135ac05'
         '70cfeaf0a408374fb80a184522865ff6')
b2sums=('224ea975f87116870784b0d96aa2635c19ddf3ce58fb530073cbcaca428e9e28c3610815a4273a71fbf826ecf6a25c74a3eca2822fdd15cc895de8f166376e0e'
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
