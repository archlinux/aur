# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=aisdk
_pkgver=1.4.12
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Unified Interface for AI Model Providers"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-base64enc
  r-callr
  r-curl
  r-digest
  r-httr2
  r-jsonlite
  r-memoise
  r-processx
  r-r6
  r-rlang
  r-yaml
)
optdepends=(
  r-cli
  r-dbi
  r-devtools
  r-dotenv
  r-dplyr
  r-dt
  r-evaluate
  r-fs
  r-ggplot2
  r-httptest2
  r-pkgload
  r-readr
  r-readxl
  r-rsqlite
  r-rstudioapi
  r-skimr
  r-testthat
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cd35f0141d82f53391a189ff41976ca8')
b2sums=('1a1d6658469968bd1fda84dbebe9356abdd29f43b0519c84e0884729d2a7956318fd3a65f7ccff96e7e2d11b655961be4b03f3c33bca0cd1e4a8a437977d74a8')

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
