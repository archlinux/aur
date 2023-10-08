# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=puma
_pkgver=3.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Propagating Uncertainty in Microarray Analysis(including Affymetrix tranditional 3' arrays and exon arrays and Human Transcriptome Array 2.0)"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(LGPL)
depends=(
  r-affy
  r-affyio
  r-biobase
  r-mclust
  r-oligo
  r-oligoclasses
)
optdepends=(
  r-affydata
  r-annotate
  r-limma
  r-pumadata
  r-rocr
  r-snow
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-lto.patch")
md5sums=('ec485bb2cd3bc9d97a2badb8b1c0be2d'
         '885d25cbb9335808ed144d24c323737c')
sha256sums=('5b7b32a5b2aa5d6c237870296a1f41927efe3ceb9d1df612559f31f010f6c529'
            'f8a3b4534b24c2a2a0d7c607cdac148b8b18706b2bf8fcf69b70142b54241bf7')

prepare() {
  # fix compiling with lto
  patch -Np1 -i fix-lto.patch
}

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
