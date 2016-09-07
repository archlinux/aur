# Maintainer: Chris <christopher.r.mullins g-mail>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=gdcm
pkgver=2.6.5
pkgrel=6
pkgdesc='a C++ library for DICOM medical files'
arch=('i686' 'x86_64')
url='http://gdcm.sourceforge.net'
license=('BSD')
optdepends=('python2: python bindings'
            'java-runtime: java bindings'
            'vtk: vtk bindings'
            'swig: generate python wrappers')
makedepends=('cmake')
source=("http://sourceforge.net/projects/gdcm/files/gdcm%202.x/GDCM%20$pkgver/gdcm-$pkgver.tar.gz")
sha512sums=('729b949a7a7567c81115a20b2c0d2bd6376ff869a23a48acdea5a855446e60b8d15acf4c3c5a52546e5b3f2e2785e2edccdbba923c51e25280b4e64cc883202e')

build() {
  cd "$srcdir"
  mkdir -p build && cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX:FILEPATH=/usr \
    -DGDCM_BUILD_SHARED_LIBS:BOOL=ON \
    -DGDCM_BUILD_TESTING:BOOL=OFF \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DGDCM_BUILD_DOCBOOK_MANPAGES:BOOL=OFF \
    ../"$pkgname-$pkgver" 
    make
}

package() {
  cd "$srcdir"/"$pkgname-$pkgver"
  install -Dm644 Copyright.txt "$pkgdir"/usr/share/licenses/"$pkgname"/COPYING

  cd "$srcdir"/build
  make DESTDIR="$pkgdir" install
}

