# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BGmix
_pkgver=1.59.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Bayesian models for differential gene expression"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
makedepends=(
  boost
)
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('73514c333f1b07a5fe589f993a8c77e2')
b2sums=('72795c70ea4b8678d168851e8f4a68c37c413ce896dcf6c593c405119dc24fe6de99ddcd960118430f36413fa57a1bff96fbe87deb7879d7b47dc7103b054c95')

prepare() {
  cd "$_pkgname"
  mkdir boostIncl
  sed -i '58 s|-I ../boostIncl||' configure.ac
  autoconf
  sed -i '1 d' src/BGmix_main.h
  sed -i '62 d' src/BGmix_main.cpp
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
