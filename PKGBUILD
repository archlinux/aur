# Maintainer: Chris <christopher.r.mullins g-mail>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=gdcm
pkgver=2.6.6
pkgrel=7
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
sha512sums=('9bfa2e7c2f0e7ef15aa7b01ab1ea9e57f194da44b8d18f83e99cbb92f5191ad4535ebe28ffa4e14e38dcf7b8dbf682add08adc6b657a33795b20c4f28f91f247')

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

