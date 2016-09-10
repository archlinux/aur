# Maintainer: Rafael G. Martins <rafael@rafaelmartins.com>

pkgname=tinypy
pkgver=1.1
pkgrel=2
pkgdesc="A minimalist implementation of python in 64k of code"
arch=('i686' 'x86_64')
url="https://github.com/philhassey/tinypy"
license=('MIT')
makedepends=('python')
optdepends=('sdl: for pygame module')
source=(https://github.com/philhassey/tinypy/archive/1.1.tar.gz setup.py_python2.diff)
md5sums=('2cf555944ad8ed82375c6c4e7c3ad338' '08a8a95b04cb9be079b920397ce397cf')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir build
  patch -u setup.py ../setup.py_python2.diff
  python2 setup.py linux pygame
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir -p ${pkgdir}/usr/bin \
           ${pkgdir}/usr/share/licenses/${pkgname}
  install -D -m755 ${srcdir}/${pkgname}-${pkgver}/build/${pkgname} ${pkgdir}/usr/bin/
  install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
