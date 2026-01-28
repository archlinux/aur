# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=OrgMassSpecR
_pkgver=0.5-4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Organic Mass Spectrometry"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSD-2-Clause')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6b76a0001cecd3b4462cfcf30ee68857')
b2sums=('de5031164df6fdbcaacecb6d4f61f3deec4fa4f9e27aeaa132e3ec3683e0cf072efb6026dffd36fe91ea56c8eb95b83462e58b93b56b735930d114b877ba3120')

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
