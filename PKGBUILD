# Maintainer: Fredrick Brennan <copypaste@kittens.ph>
# Author: inemum <newmanisaac49@gmail.com>

# based on https://git.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/sip

pkgname=('python2-sip-pyqt4')
pkgver=4.19.13
pkgrel=1
arch=('x86_64')
url='http://www.riverbankcomputing.com/software/sip/intro'
license=('custom:"sip"')
makedepends=('python2')
source=("http://sourceforge.net/projects/pyqt/files/sip/sip-$pkgver/sip-$pkgver.tar.gz")
sha256sums=('e353a7056599bf5fbd5d3ff9842a6ab2ea3cf4e0304a0f925ec5862907c0d15e')

prepare() {
  mkdir -p build-pyqt4-py2
}

build() {
  cd "$srcdir"/build-pyqt4-py2
  python2 ../sip-$pkgver/configure.py CFLAGS="$CFLAGS" LFLAGS="$LDFLAGS" --sip-module PyQt4.sip --no-tools
  make
}

package_python2-sip-pyqt4() {
  pkgdesc="Python 2.x SIP bindings for C and C++ libraries (PyQt4 version)"
  depends=('python2')

  cd build-pyqt4-py2
  make DESTDIR="$pkgdir" install

  install -Dm644 ../sip-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

