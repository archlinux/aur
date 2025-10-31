# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GraphAlignment
_pkgver=1.74.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="GraphAlignment"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LicenseRef-GraphAlignment')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('648901bc2117e51bab5217a7cd73eaef')
b2sums=('8d16c35ea566590c12b2e828625a77b24c32a1caaeec931f258e6df344ea863e09bfa32e52c97a5e20bdcb7a4b1a009ab83878d23b6a14eded52bc34419cb4cb')

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
