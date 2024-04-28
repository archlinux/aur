# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HDF5Array
_pkgver=1.30.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="HDF5 backend for DelayedArray objects"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  curl
  openssl
  r-biocgenerics
  r-delayedarray
  r-iranges
  r-rhdf5
  r-rhdf5filters
  r-s4arrays
  r-s4vectors
  zlib
)
makedepends=(
  r-rhdf5lib
)
optdepends=(
  r-biocparallel
  r-delayedmatrixstats
  r-experimenthub
  r-genefilter
  r-genomicfeatures
  r-genomicranges
  r-h5vcdata
  r-runit
  r-singlecellexperiment
  r-summarizedexperiment
  r-tenxbraindata
  r-zellkonverter
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "$_pkgname-fix-format.patch::https://github.com/Bioconductor/HDF5Array/commit/3a085de096de2811cd4fc77b8e7e5718b2192991.patch")
md5sums=('880ca20592c69a77a31650298a9c67bf'
         'c8a7753951df8a99b68187852b9ca134')
b2sums=('52ac03f23156a4524bed5345c6d6e92409ac541ac98ed2ade381f699a469bad95d12cafd61231e9a5d42f726b32f5566a10f020e3f7d0b6cd1a2baf8bd1721c8'
        '05a3677dfcc2da4dfd5322d02799387abf2422f3056c520589179f29dbed2bb5ac32a4024cfaf3f96a9b2c9e5e740a803944deda5fb6aa2185dc46fbb4c9751f')

prepare() {
  # fix format string errors
  patch -Np1 -d "$_pkgname" < "$_pkgname-fix-format.patch"
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
