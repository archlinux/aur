# Maintainer: Chris <christopher.r.mullins g-mail>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=gdcm
pkgver=2.8.0
pkgrel=9
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
sha512sums=('fd365888690c054ff24171cf1ad777da2afc4130edef524f7d5b7dc5cc973efacc64177525662c501c31c4320fcc0eeacd11f711387e7f1ccea596b5e4aa4dda')

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

