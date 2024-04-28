# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=genefilter
_pkgver=1.84.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="methods for filtering genes from high-throughput experiments"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotate
  r-annotationdbi
  r-biobase
  r-matrixgenerics
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-all
  r-biocstyle
  r-hgu95av2.db
  r-knitr
  r-rcolorbrewer
  r-roc
  r-tkwidgets
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "$_pkgname-fix-format.patch::https://github.com/Bioconductor/genefilter/pull/13.patch")
md5sums=('15011d1662a58967aeb3e89f1f660e40'
         'f192fbd037f307740c07f4131aecfcfb')
b2sums=('fb1c5d61c75424a5feba2edfcd8fee6b4f224097d9353425f9d533bd323a9e8c6a6f48b67252b6570e308966ca0fa55eeef9a992d181adefa6703eeca9983404'
        '0b0bf3818c026825f3cf007d566a32404553b4363e2671f14c3465ee3168ef71d8939811d93cd4c0d0c3158decaf5e47f63593f36afb793de183ef7713d8c230')

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
