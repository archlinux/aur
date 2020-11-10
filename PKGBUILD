# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-occ
pkgver=7.4.1
pkgrel=1
pkgdesc="A python library whose purpose is to provide 3D modeling features"
url="https://github.com/tpaviot/pythonocc-core"
arch=(x86_64)
license=('LGPL3')
makedepends=('cmake' 'swig')
depends=('opencascade' 'python')
source=(https://github.com/tpaviot/pythonocc-core/archive/${pkgver}.tar.gz)
sha256sums=('6d62002244a0e7f4e5c1ad590d332a60601c44b2501ad017361443b54371e667')

prepare() {
  cd pythonocc-core-${pkgver}
  mkdir -p build
  cd build
  cmake ..
}

build() {
  cd pythonocc-core-${pkgver}/build
  make
}

check(){
  cd pythonocc-core-${pkgver}/build
  #mkdir tmp
  #make DESTDIR=tmp install
  #cd pythonocc-core-${pkgver}/test
  
  #python run_tests.py
}


package() {
  cd pythonocc-core-${pkgver}/build
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/pythonocc-core-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
