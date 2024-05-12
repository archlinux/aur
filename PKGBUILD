# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HilbertVisGUI
_pkgver=1.62.0
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
md5sums=('6d0838301b345c1f905c10a7a90ea8b4'
         '950ae2bcf091fb161716d590be861702')
b2sums=('b87b9c986a81a863ff0839d2d049c28b65889cb0a37a9a462ec5156941a0f318c44449fb8077de8c1ffa3f0f92b39f883157632c7a40d539c963e8cabee740ca'
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
