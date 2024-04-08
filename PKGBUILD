# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=genArise
_pkgver=1.78.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('d81489147ccfe688c07c228b7fcfcf7d')
b2sums=('95a674942bf301f6b4e8c227ac25d7810eec88e497448aa0b852d3701136b1ac4c05f590b6bb7082fef11186bca9536bcd7665ca826b66c703ba46ce2fd654d4')

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
