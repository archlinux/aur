
pkgname=gwyddion-no-python2
_pkgname=gwyddion
pkgver=2.62
pkgrel=1
pkgdesc="A data visualization and processing tool for scanning probe miscroscopy (SPM, i.e. AFM, STM, MFM, SNOM/NSOM, ...) and profilometry, useful also for general image and 2D data analysis"
url="http://gwyddion.net/"
license=("GPL")
arch=('i686' 'x86_64')
depends=(gtkglext fftw minizip)
makedepends=('pkgconf')
optdepends=('libxml2: import of SPML and APE DAX data files'
            'zlib: import of SPML data files and import of gzip-compressed data from other file formats (Createc, NRRD, RHK SM4 PRM metadata)'
            'perl: development of plug-in'
            'ruby: development of plug-in'
            'fpc: development of plug-in'
            'bzip2: import of bzip2-compressed data from NRRD'
            'libpng: export of height fields to 16bit greyscale PNG images and import from 16bit PNG images'
            'libwebp: WebP format support for the image export'
            'libzip: import of APE DAX, NanoObserver, NanoScanTech, OpenGPS and Sensofar PLUX data files'
            'cfitsio: import of Flexible Image Transport System (FITS) files'
            'openexr: import and export of OpenEXR HDR images'
            'hdf5: import of Ergo data files')
provides=('gwyddion')
conflicts=('gwyddion')
source=(https://downloads.sourceforge.net/sourceforge/gwyddion/$_pkgname-$pkgver.tar.xz)
sha256sums=('47d93ec1f233dbb6b0c502e0ab99ab0db5a9b8c1605625717b457709e1341fac')


build() {
  cd $_pkgname-$pkgver

#  ./configure --prefix=/usr --disable-desktop-file-update \
#		--disable-rpath \
#		--enable-library-bloat \
#		--enable-plugin-proxy \
#              --disable-updater --disable-schemas-compile \


  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --libexecdir=/usr/lib \
              --with-python=no --enable-pygwy=no
  make
}

package() {
  cd $_pkgname-$pkgver

  make DESTDIR="$pkgdir" GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1  install
}




