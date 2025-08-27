# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=genepop
_pkgver=1.2.11
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Population Genetic Data Analysis Using Genepop"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('CECILL-2.0')
depends=(
  r-rcpp
  r-stringr
)
makedepends=(
  r-rcppprogress
)
optdepends=(
  r-knitr
  r-shiny
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "$_pkgname-LICENSE::http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt")
md5sums=('5ac3b4382b3b112797cdede4bf9cd4fb'
         '599cf91b33571e942d3ba5f9623b8011')
b2sums=('447f0c9d350f7cb1801e8bed776f131796515642c9afb70c09fe856cea144c5c1717de371f08eff28ea20c8eca91539a3f90e78ce86f58ce54f0fc0526e6ac1f'
        'ff97dacc39b8597e670dbaf5bc0f0e4db73eada273708433fc227fa72c054a30a67dbc7b2416089d68f09ab65da721e5b30711022c41047d9cf706731d568038')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -Dm644 "$_pkgname-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
