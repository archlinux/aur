# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rmpi
_pkgver=0.7-2.1
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
md5sums=('e8fee7664f9de0ccc4e8ab071d26e650'
         '5922dce2ffadb52b20b8b0f53b74536e')
b2sums=('7724186da6f81bf5cd04c5be96a93fd8da83eec59395000d57c4ad93738a33909b415933c98bce96177faa3feaf8d401beb12d0962c118d2038d086b18f0b692'
        'b8b1306f851458c2842bdef88a693e716e08f9fc108e51a97748c783c2ca01a48417f40587f88cb68e2cd693629db02840dfa87fb5197a5b9c3c9a973942f7b8')

prepare() {
  cd "$_pkgname"
  # remove unnecessary check for orted
  patch -Np1 -i ../fix-build.patch
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
