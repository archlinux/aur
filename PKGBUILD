# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=this.path
_pkgver=2.1.0
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
md5sums=('fb77691e7f1f34b8f393d4b2b221285d')
sha256sums=('3ec5ae67776587fd932bf079fd7082947b03943010fec8d79ba5167184a201e3')

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
