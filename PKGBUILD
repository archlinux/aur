# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RITANdata
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="This package contains reference annotation and network data sets"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-knitr
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b88ca49dc419bc7657725fd9a71194e2')
b2sums=('46078ba9f94a1f1bfbeafb805cc340048740c7a303d7c81353d9b2578f149d3bbbf7443c2a8ddd8fd59ff7b6c82e88ef00644860fec8c78e6d13a90f22ffa9a6')

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
