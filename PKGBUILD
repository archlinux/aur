# Maintainer: Chris <christopher.r.mullins g-mail>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=gdcm
pkgver=2.6.2
pkgrel=3
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
sha512sums=('0f3f66db5f27ff3f7cde2eb50878aa47a700880ca79fde450846dd0dc33a0176453175b6d50f41f64e1c28eb0b2023e7a2cdc2b2c7f40097939a40449650ab98')

build() {
  cd "$srcdir"
  mkdir -p build && cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX:FILEPATH=/usr \
    -DGDCM_BUILD_SHARED_LIBS:BOOL=ON \
    -DGDCM_BUILD_TESTING:BOOL=OFF \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    ../$pkgname-$pkgver 
    make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  install -Dm644 Copyright.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  cd "$srcdir"/build
  make DESTDIR="$pkgdir" install
}

