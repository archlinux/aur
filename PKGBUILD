# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cisPath
_pkgver=1.46.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Visualization and management of the protein-protein interaction networks"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-build.patch")
md5sums=('85e7b9da3b42679a1b3b3cb45956e5d0'
         '90d1a443b9782134472f0b84fe944ce3')
b2sums=('2e82c94f2a5d4c6601632df185a1c5da319e00c61e6aa518fa6814fa2d083bd169feb89394373a7784ebe0f2b533cf6346945cb2af66b2e9b0c95fe5f6749762'
        '67c1b2925a57b75420408f7ce208e677a6def4622d2977f3cc349520c901685042b96302bcfc30e0816bb23f13ed5e6f70c50e7eee5e8fa58643d09d8dfb96c5')

prepare() {
  # fix format string errors
  patch -Np1 -i fix-build.patch
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
