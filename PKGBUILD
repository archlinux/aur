# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=blaster
_pkgver=1.0.9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Native R Implementation of an Efficient BLAST-Like Algorithm"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSD-3-Clause')
depends=(
  r-rcpp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cff66e0511c61be25ab9068dffeb15a9')
b2sums=('223826dce74cf4daf7b60e87b70490c3ec31b31a40bb0d2e28eb9260c9d7c71b41a4159d1d9d86607eb7e9a9a293c248c24b139b094fccc8b1efc2375a393570')

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
