# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=puma
_pkgver=3.48.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Propagating Uncertainty in Microarray Analysis(including Affymetrix tranditional 3' arrays and exon arrays and Human Transcriptome Array 2.0)"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
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
md5sums=('6d7a6b96c444d8e8321bd9d616fb0950'
         '885d25cbb9335808ed144d24c323737c')
b2sums=('b4e6014b9106622af10de19a3fc012a27e3afe6f121e0f5a9bde102aa32e89e330985eadca71bdf23b774ac6ce974321f0bc8c59948b7766f3846ea6c96edee5'
        'f896fbaf21a3812527640043cb322e51ca2d4365306619deba7dcbd3f47ed0d68656c898dd84a69ad32dd8823c8e00ec93eef877e49f9b0d0816de9607a38b04')

prepare() {
  # fix compiling with lto
  patch -Np1 -i fix-lto.patch
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
