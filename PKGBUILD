# Maintainer: Antonio Cervone <ant.cervone@gmail.com>
# Contributor: Graziano Giuliani <graziano.giuliani@poste.it>

pkgname=metview
pkgver=5.19.2
pkgrel=1
pkgdesc="ECMWF interactive meteorological application"
arch=(i686 x86_64)
url="https://confluence.ecmwf.int/display/METV/Metview"
license=('APACHE')
groups=(science)
depends=(cgal 'magics++>=4.10.0' qt6-5compat qt6-svg snappy)
makedepends=(boost cmake rpcsvc-proto gcc-fortran)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(https://confluence.ecmwf.int/download/attachments/3964985/Metview-${pkgver}-Source.tar.gz)
noextract=()
sha256sums=('3a06337b2e84ca2633ac8894b7a359d2c97416bf94579639da4cf70576f48700')

# prepare() {
#   cd Metview-${pkgver}-Source
#   patch --forward --strip=1 --input=$srcdir/gfortran.patch
#   patch --forward --strip=1 --input=$srcdir/string.patch
# }

build() {
  cmake \
    -B build \
    -S Metview-${pkgver}-Source \
    -Dmagics_DIR=/usr/share/magics/cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=production \
    -DCMAKE_INSTALL_DATADIR=/usr/share \
    -DPYTHON_EXECUTABLE=/usr/bin/python3

  make -C build
}

package()
{
  make -C build DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
