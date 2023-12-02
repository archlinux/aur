# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=puma
_pkgver=3.44.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Propagating Uncertainty in Microarray Analysis(including Affymetrix tranditional 3' arrays and exon arrays and Human Transcriptome Array 2.0)"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
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
md5sums=('ed1d90c9c9b7751611b0f32edf0a1ffb'
         '885d25cbb9335808ed144d24c323737c')
sha256sums=('b33de21f8d1bde7e16c2dff3347d67ebb03861423713c4d00de0e94b887ba0e8'
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
