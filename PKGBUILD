# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=isotree
_pkgver=0.6.1-5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Isolation-Based Outlier Detection"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSD-2-Clause')
depends=(
  r-jsonlite
  r-rcpp
  r-rhpcblasctl
)
makedepends=(
  robin-map
)
optdepends=(
  r-diagrammer
  r-kableextra
  r-kernlab
  r-knitr
  r-mlbench
  r-mlmetrics
  r-outliertree
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "system-robin-map.patch")
md5sums=('120fb05ba5a73ef95b374c9f17148d4b'
         'eb4f3a13cc4014676e7b49b44982d662')
b2sums=('acc330a3e58921140bdf603a161c3b0f73ab979b4eafce2541fc5957dfb8f2b982374f558f23c317930cdc231ad22d4e6722441b348880cc1a39178f971e64cc'
        '061b04fafc1523f3e9f892f68d747b4dd7434193dee5a8e41e3739870addcc9e10b7777c1fa3916dab7d405c7d856406418093c4b490085e88480ec6bb15f001')

prepare() {
  # use system robin-map
  patch -Np1 -i system-robin-map.patch
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
