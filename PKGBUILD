# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tcltk2
_pkgver=1.2-11
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=6
pkgdesc="Tcl/Tk Additions"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-3.0-only AND LicenseRef-tcltk2')
depends=(
  r
  tk
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8c2bb042e85986436eaf4b3e49e242ec')
b2sums=('4864384637398419273373e7778a116cd9042278282eb2259aa6d1540524ed5b06edcd1a5606ec9ae118b72987bfd7a3202ad4a2e416040cc80b16a21f82834f')

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
