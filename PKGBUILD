# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pcxnData
_pkgver=2.25.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Correlation coefficients and p values between pre-defined pathway/gene sets"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-pcxn
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1428be1acb277a680379b64d1ec8fb7e')
b2sums=('40acf4b8c78abd42ae56a212efd3ed84cc51663ef5a2b4c1c6339a57befbb62879717628933cceaa66fd6f565abc012f52684b27ce98fbc7f3e81bb169c9255a')

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
