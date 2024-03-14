# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pcxnData
_pkgver=2.24.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('7814b1a6f5dbd08e71df1e92ea4328f6')
b2sums=('72416295922d60f8932329bb0aa7c2cdbafcf4e55b7483f53245bae94cd7a3859d3932dad9fd4509169779707e52dd34a8ac44261f81704bfe29e82937aa0b0a')

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
