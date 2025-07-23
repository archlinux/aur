# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lgr
_pkgver=0.5.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Fully Featured Logging Framework"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-r6
)
optdepends=(
  r-cli
  r-covr
  r-crayon
  r-data.table
  r-desc
  r-future
  r-future.apply
  r-glue
  r-jsonlite
  r-knitr
  r-rmarkdown
  r-rotor
  r-rprojroot
  r-testthat
  r-tibble
  r-whoami
  r-yaml
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fbe51331d79e570af84cb2ebeba9e1c0')
b2sums=('52b94565543f5e1ff88214cb98024ba53bc236c30bddeb39d5056bdbf07210e7d7d43406d374161667a23c9a954dacdfe670e742281cb422bdf85649b7b8e22c')

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
