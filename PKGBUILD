# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=genArise
_pkgver=1.84.0
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
md5sums=('edebbb346e4932a3caf4949c7c75c0ab')
b2sums=('4459db9f6350f42bccacfdde765a84698ebf452e98063cbe5a46e0b9e8dedd119d399f83ac76e75441b7c5e3055a0ca3faed6487f7162ba8b5610f3f1c8a07e3')

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
