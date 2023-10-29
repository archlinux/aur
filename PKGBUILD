# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=this.path
_pkgver=2.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Get Executing Script's Path"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
depends=(
  r
)
optdepends=(
  r-microbenchmark
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('bd4ba60db6d180122cce75ac381b27bb')
sha256sums=('166e881d0612802406aa239e83187ca55badc124d95af0a3fa89dc38efb7b5b6')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
