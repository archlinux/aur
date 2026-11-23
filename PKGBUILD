# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=ecodive
_pkgver=2.3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Parallel and Memory-Efficient Ecological Diversity Metrics"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-knitr
  r-parallelly
  r-rmarkdown
  r-slam
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0aea717db895ad49fc6d909ff456b463')
b2sums=('84450d52081e36ddf3aa5ce54966d469fd6f30c44c75bb751883b2d5f2add224031eb64f008061b60e5f40fe9b32247f0176b8833e1ff0a298ed6130c6e00924')

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
