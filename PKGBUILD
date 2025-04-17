# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=pfamAnalyzeR
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Identification of domain isotypes in pfam data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-dplyr
  r-magrittr
  r-readr
  r-stringr
  r-tibble
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('478cac0e5de36598963c2a633e337339')
b2sums=('b5aa79be22a41968796c6d081d4f98215ffa3ee61b29853b7953650805576cbd8aa0d9a72d7aa9d34e55cb6ac755989f5c65fa735e7afc3e94e40b59397b641a')

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
