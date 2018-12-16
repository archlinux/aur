# Maintainer: Chris <christopher.r.mullins g-mail>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=gdcm
pkgver=2.8.8
pkgrel=11
pkgdesc='a C++ library for DICOM medical files'
arch=('i686' 'x86_64')
url='http://gdcm.sourceforge.net'
license=('BSD')
optdepends=('python2: python bindings'
            'java-runtime: java bindings'
            'vtk: vtk bindings'
            'swig: generate python wrappers')
makedepends=('cmake'
             'openjpeg2')
source=("http://sourceforge.net/projects/gdcm/files/gdcm%202.x/GDCM%20$pkgver/gdcm-$pkgver.tar.gz")
sha512sums=('623f5f9611aeff219b9d2a5ff880ad16cea33f40cf4be6206d58387ed8853d83db61578daa567fc6bfdb62fba677f8b145c0314f1271672176db49e35b1da8e2')

build() {
  cd "$srcdir"
  mkdir -p build && cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX:FILEPATH=/usr \
    -DGDCM_BUILD_SHARED_LIBS:BOOL=ON \
    -DGDCM_BUILD_TESTING:BOOL=OFF \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DGDCM_BUILD_DOCBOOK_MANPAGES:BOOL=OFF \
    -DGDCM_USE_SYSTEM_OPENJPEG:BOOL=ON \
    ../"$pkgname-$pkgver" 
    make
}

package() {
  cd "$srcdir"/"$pkgname-$pkgver"
  install -Dm644 Copyright.txt "$pkgdir"/usr/share/licenses/"$pkgname"/COPYING

  cd "$srcdir"/build
  make DESTDIR="$pkgdir" install
}

