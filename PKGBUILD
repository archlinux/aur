# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=cpp11bigwig
_pkgver=0.3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Read bigWig and bigBed Files"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  curl
  r-genomicranges
  r-iranges
  r-s4vectors
  r-tibble
  zlib
)
makedepends=(
  r-cpp11
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b92c5b7fa1499b12d6b85114cf9b3ad3')
b2sums=('ea9a046cc5055921f4821281a43a0284dc0644e3886f65a0b36b7aa66c9329ae9e2f0c7ccb54959fa6f04bfe5a17a1a8083f702ab7f8813845657b908b59730a')

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
