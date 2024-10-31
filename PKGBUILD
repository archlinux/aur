# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MANOR
_pkgver=1.78.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="CGH Micro-Array NORmalization"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-glad
)
optdepends=(
  r-bookdown
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "$_pkgname-fix-build.patch::https://github.com/pneuvial/MANOR/pull/4.patch")
md5sums=('24220ee4180315752bbfef71dcaae920'
         'ecb77c1d613977effbc8aa1c27fce89a')
b2sums=('ea27c0e65ae10ac1c89db007522165265ed23beaea43080a2a2815d27995fab34bdfd6162a3d14e814c0249cfaa6f83a95c130035b43cbcc1025424e77fef23e'
        '1b6770bb700ce4451769eaba495da581056ffbcc8554205400ad0d4246c487ecf9e8c7d0c2152badefa22fb273175467a0bad664da858cf8c6f6d9f8bc707ec5')

prepare() {
  # fix format string errors
  patch -Np1 -d "$_pkgname" < "$_pkgname-fix-build.patch"
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
