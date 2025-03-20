# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rmpi
_pkgver=0.7-3.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interface (Wrapper) to MPI (Message-Passing Interface)"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  openmpi
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix-build.patch")
md5sums=('367cca4ef38cb4b54695126648081073'
         '5922dce2ffadb52b20b8b0f53b74536e')
b2sums=('8e97a28b4ab53b4b1ecaed9ef0c754044d5f0ff731f7605885a98ee90c012fb69e97222ca708fbf19191a568315ba4babd8b30ab85b3da28bddbc66b38e6189a'
        'b8b1306f851458c2842bdef88a693e716e08f9fc108e51a97748c783c2ca01a48417f40587f88cb68e2cd693629db02840dfa87fb5197a5b9c3c9a973942f7b8')

prepare() {
  cd "$_pkgname"
  # remove unnecessary check for orted
  # patch -Np1 -i ../fix-build.patch
  autoconf
}

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
