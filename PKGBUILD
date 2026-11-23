# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=crew
_pkgver=1.3.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="A Distributed Worker Launcher Framework"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-cli
  r-collections
  r-data.table
  r-later
  r-mirai
  r-nanonext
  r-processx
  r-promises
  r-ps
  r-r6
  r-rlang
  r-tibble
  r-tidyselect
)
optdepends=(
  r-autometric
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f582a10f9e89966df487a814fee4de90')
b2sums=('53c4edfdc20f52a055ee4d2294cde85f7164a1290192392da514a503ac83b470dff74cf44f6147bb9eab8f37af92bc20cfb6ebe700bb7021e8f37fd9b7cb5e1e')

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
