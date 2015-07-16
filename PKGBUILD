# Maintainer: George Eleftheriou <eleftg>
# Contributor: jedbrown
# Contributor: mickele
# Contributor: gborzi
# Contributor: abenson

pkgname=metis
pkgver=5.1.0.p1
_pkgver=5.1.0-p1
pkgrel=1
pkgdesc="METIS is a set of serial programs for partitioning graphs, partitioning finite element meshes, and producing fill reducing orderings for sparse matrices."
url="http://glaros.dtc.umn.edu/gkhome/metis/metis/overview"
license="custom"
makedepends=(make gcc patch sed coreutils cmake)
install=${pkgname}.install
arch=('i686' 'x86_64')
options=('docs')
#source=(http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis/${pkgname}-${pkgver}.tar.gz)
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
  # Install doc and license
  #install -m644 -D manual/manual.pdf ${pkgdir}/usr/share/doc/$pkgname/manual.pdf
  install -m644 -D LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
