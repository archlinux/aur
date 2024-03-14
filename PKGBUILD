# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sparsesvd
_pkgver=0.2-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Sparse Truncated Singular Value Decomposition (from 'SVDLIBC')"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSD-3-Clause')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d4e8f508c05c4ddf26031e6da48b8591')
b2sums=('0e4faed4e02f2491488b9d8b5171b6cbd21473b01a247c5d549bbc65241e372516a3975659ea61763368c352530d909646125ecd86bb3404f253867f29ad4059')

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
