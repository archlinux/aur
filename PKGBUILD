# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lgr
_pkgver=0.5.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('5edb5e4a6ce4ebce4af5f89524f101a7')
b2sums=('d4772c96f49493d1bff56ecaaafd5595a839a83433e87c9f2b9dfaf7684416dccddf6427423cf1b280f94a4510b215ff4e629dd2aa13afb2451b0e6503e83a4a')

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
