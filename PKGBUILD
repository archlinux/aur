# $Id$
# Maintainer:
# Contributor: jedbrown
# Contributor: eleftg
# Contributor: mickele
# Contributor: gborzi
# Contributor: abenson
# Contributor: dshizzle

pkgname=metis-64
_pkgname=metis
pkgver=5.1.0.p3
_pkgver=5.1.0-p3
pkgrel=1
arch=(i686 x86_64)
pkgdesc="A set of serial programs for partitioning graphs, partitioning finite element meshes, and producing fill reducing orderings for sparse matrices. This package has 64-bit wide integer and floating-point enabled."
url="http://glaros.dtc.umn.edu/gkhome/metis/metis/overview"
license=(custom)
depends=(glibc)
makedepends=(cmake)
options=(docs)
provides=(metis)
conflicts=(metis)
source=("http://ftp.mcs.anl.gov/pub/petsc/externalpackages/${_pkgname}-${_pkgver}.tar.gz")
sha256sums=('5b55e4f955f4416160c82d7a0aa763a94b95548de87867a46e256585a26d833c')

build() {
  cd $_pkgname-$_pkgver
  make config shared=1 prefix=/usr longindex=1 doubleprecision=1
  make
}

package() {
  cd $_pkgname-$_pkgver

  make install DESTDIR="$pkgdir"
  install -m644 -D LICENSE.txt "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
