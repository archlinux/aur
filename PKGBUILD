# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=isotree
_pkgver=0.5.24-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Isolation-Based Outlier Detection"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(BSD)
depends=(
  r-rcpp
)
makedepends=(
  robin-map
)
optdepends=(
  r-jsonlite
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
md5sums=('187c07e96a3e58931b39747e3aa18112'
         'eb4f3a13cc4014676e7b49b44982d662')
sha256sums=('d46dac42a4fca9d87c5dd46ffa84f4297c11f1831dc2ff6562bfb0897c9a9609'
            '21873d5c2e0fb0ea13156b91de036c7c02b1284a0e262f95b81988161c1915a5')

prepare() {
  # use system robin-map
  patch -Np1 -i system-robin-map.patch
}

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
