# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=puma
_pkgver=3.56.0
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
md5sums=('c8301d58f1fe2b17c86eaac06d55e5a6'
         '885d25cbb9335808ed144d24c323737c')
b2sums=('b7a01955fa3d6467a7556a32599affa83b22e0c3731ef496662cc66f5384ab1dea4bf44c5cdeda86dcc53ff485ec56d5a7a0a6d4eabf2b0c838f615b65937b9a'
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
