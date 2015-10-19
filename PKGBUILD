# Maintainer: jedbrown
# Contributor: eleftg
# Contributor: mickele
# Contributor: gborzi
# Contributor: abenson

pkgname=metis
pkgver=5.1.0.p1
_pkgver=5.1.0-p1
pkgrel=2
pkgdesc="a set of serial programs for partitioning graphs, partitioning finite element meshes, and producing fill reducing orderings for sparse matrices."
url="http://glaros.dtc.umn.edu/gkhome/metis/metis/overview"
license=("custom")
makedepends=("cmake")
install="${pkgname}.install"
arch=('i686' 'x86_64')
options=('docs')
# source=("http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis/${pkgname}-${pkgver}.tar.gz")
source=("http://ftp.mcs.anl.gov/pub/petsc/externalpackages/${pkgname}-${_pkgver}.tar.gz")
sha256sums=('a82d0f0ec65f51d88766a9548c78b42ef4481e2d76d0361dc972c08e529b3e96')

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  make config shared=1 prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}"

  make install DESTDIR="${pkgdir}"
  install -m644 -D LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
