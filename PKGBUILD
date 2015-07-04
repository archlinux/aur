# Contributor: Benjamin Sick

pkgname=gmt4
pkgver=4.5.13
pkgrel=1
pkgdesc="Generic Mapping Tools V4: Collection of tools for manipulating geographic and Cartesian data sets, and generating EPS maps."
arch=(i686 x86_64)
url="http://gmt.soest.hawaii.edu/"
license=('GPL')
depends=('gdal' 'octave' 'tcsh' 'libxaw')
optdepends=('ghostscript' 'gmt-coast')
conflicts=('gmt')
install=gmt.install
source=(ftp://ftp.soest.hawaii.edu/gmt/gmt-${pkgver}-src.tar.bz2)
md5sums=('cc577e8c600ab0ea8e1ee7412a5902a6')

build() {
  cd ${startdir}/src/gmt-${pkgver}
  ./configure --prefix=/usr \
    --enable-gdal --enable-octave \
    --enable-triangle --enable-shared \
    --enable-eps --with-gshhg-dir=/usr/share/gmt/coast
  make || return 1
}

package() {
  cd ${startdir}/src/gmt-${pkgver}
  export MAKEFLAGS="-j1"
  make DESTDIR=${pkgdir} install-all || return 1
}

# vim:set ts=2 sw=2 et:
