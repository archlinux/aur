# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=genepop
_pkgver=1.2.17
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
md5sums=('159e56abfd9ce839f8fdcd11722ec3ca'
         '599cf91b33571e942d3ba5f9623b8011')
b2sums=('ee819262834f9dcddcd7ab540f609f921b1ae80e93987095932e4394632562b6e311c96cc6162bfac57bf645ec494b691b29f926623829588f324a5f2420f365'
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
