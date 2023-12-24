# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Brandon Andrews <bsa@bsa.isa-geek.com>
# Contributor: Mael Kerbiriou <mael.kerbiriouATfreeDOTfr>
pkgname=pfstools
pkgver=2.2.0
pkgrel=2
pkgdesc="Set of command line programs for reading, writing and manipulating high-dynamic range (HDR) images"
arch=('i686' 'x86_64')
url="http://pfstools.sourceforge.net/"
license=('LGPL2.1')
depends=('gcc-libs')
provides=('pfscalibration' 'pfstmo')
conflicts=('pfscalibration' 'pfstmo')
optdepends=('dcraw: RAW support'
            'fftw: durand02,fattal02,ferradans11 tone mapping operators'
            'freeglut: OpenGL image viewer pfsglview'
            'glu: OpenGL image viewer pfsglview'
            'gsl: mantiuk08 tone mapping operator'
            'imagemagick: ImageMagick support'
            'netpbm: PBM support'
            'octave: Octave support, pfsstat'
            'opencv: pfsalign'
            'openexr: OpenEXR support'
            'python: pfs_split_exposures.py'
            'qt5-base: pfsalign, pfsview')
makedepends=('cmake' 'qt5-base' 'octave'
             'openexr' 'libmagick6' 'libtiff' 'netpbm'
             'gsl' 'fftw' 'libexif' 'opencv'
             'freeglut' 'glu')
options=(!libtool)
source=("http://downloads.sourceforge.net/pfstools/$pkgname-$pkgver.tgz"
        "force_imagemagick6.patch")
b2sums=('dbb5e0ab8613014b3698591acef95f5b846473997b158701ee1dbeb28f43d5af098f4267bac6c5194bf61da619bb5d38c5cd86f9e970483fb550b866b3d43a47'
        'f7874dbd47672278404085d372c44102a08b0e9ba69aaa0db625bb05cdd493fb6155ee02a76f2ff459797d5a74d326051c3a0979326ed8c36bd1fed5470f9c23')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -Np1 < "$srcdir/force_imagemagick6.patch"
}

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  cmake "$srcdir/$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir/" install
}
