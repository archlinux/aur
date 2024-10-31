# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HilbertVisGUI
_pkgver=1.64.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="HilbertVisGUI"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  atkmm
  glibmm
  gtk2
  gtkmm
  libsigc++
  pangomm
  r-hilbertvis
)
optdepends=(
  r-iranges
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-build.patch")
md5sums=('dc316bebd3431b7778ab5c7acc27c52e'
         '950ae2bcf091fb161716d590be861702')
b2sums=('daad708f2f0029483696364bfcaab0a8a5a9c81f5b029e26f12a7490a74a5608358a6c98eeb0973b72476ae75da2d92f731e54778dbd8cdb00652c6385cdf7f0'
        '83a2e27a153a6037fb03d6d960be93e76ec62ed5f130aaf63c456c75ac0faed9197264505199e95aa15acbc7765fb9aeadc8532432a44fa81a6c64b64de5d849')

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
