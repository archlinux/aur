# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=S4Arrays
_pkgver=1.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Foundation of array-like containers in Bioconductor"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-abind
  r-biocgenerics
  r-crayon
  r-iranges
  r-s4vectors
)
optdepends=(
  r-biocparallel
  r-biocstyle
  r-delayedarray
  r-knitr
  r-rmarkdown
  r-sparsearray
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-build.patch")
md5sums=('56e78d721cbf2dc16d12123dca444272'
         '44df65991cadb2efced214812a02af87')
b2sums=('f3b77980a9e9886d64f4cf05e10736f7aefdeb8e98e9ce7abcb9e593f49e952dba7cc2ca2ca24d1420352d2ffb3cd58659b07d678fc7775b035f9f385de559c0'
        'd01ab0d39dabeb695599a7c002a56e8a741a1565cb7e61809a7755ed3f3887a33ecce8ff7451869e0e4792496277f6c5fa2f8db64f37afb01c5c86223442f10f')

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
