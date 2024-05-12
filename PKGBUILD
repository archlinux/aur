# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cisPath
_pkgver=1.44.0
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
md5sums=('c992f1b704f16c4c595b5b3de5490077'
         '90d1a443b9782134472f0b84fe944ce3')
b2sums=('3ee53686dd5a3f71558b6fd2df08528a5bab4ca7ff520ee7139c068012dc45628b5fe4dc1e02fdd8952b95dff14921b23ebc1fe894c0955588c478374a766402'
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
