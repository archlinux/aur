# Contributor: Benjamin Sick

pkgname=gmt4
pkgver=4.5.14
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
md5sums=('2d5bad3aaf593c46f0ff57264c2d3a47')

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
