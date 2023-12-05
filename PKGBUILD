# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=sfarrow
_pkgver=0.4.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Read/Write Simple Feature Objects ('sf') with 'Apache' 'Arrow'"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
depends=(
  r-arrow
  r-dplyr
  r-jsonlite
  r-sf
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a2e14236864928f98ae8c27590b7c3be')
sha256sums=('0f5db73f8c3058b0aad6343d2376186028cc443a7df1c515b3a1171e14f454c3')

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
