# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=genArise
_pkgver=1.82.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Microarray Analysis tool"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LicenseRef-genArise')
depends=(
  r-locfit
  r-tkrplot
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('514f7c20dc7d1821f39817ad00c0af8e')
b2sums=('7070a256a9b1b838b1857db40b5d93433efb33104bec575845f6b09765e8a3b29367fb31f1cfdf9923fdcd9f45e7b5b296ca9ba14503ad53c75aa4f296a18a3e')

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
