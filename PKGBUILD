# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lgr
_pkgver=0.4.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('0804a98afca9506aab1ea2cde5db7c8a')
b2sums=('189b16dda16e14af967f053506c9be341cd691e8bd7e17fa19223260e92687cd6e40abee16f161aaccc7a1dd9089176541897bcf87aec3cd5f1f84b31eb329df')

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
