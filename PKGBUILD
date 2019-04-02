# Maintainer: Fredrick Brennan <copypaste@kittens.ph>
# Author: inemum <newmanisaac49@gmail.com>

# based on https://git.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/sip

pkgname=('python2-sip-pyqt4')
pkgver=4.19.15
pkgrel=1
arch=('x86_64')
url='http://www.riverbankcomputing.com/software/sip/intro'
license=('custom:"sip"')
makedepends=('python2')
source=("https://www.riverbankcomputing.com/static/Downloads/sip/$pkgver/sip-$pkgver.tar.gz")
sha256sums=('2b5c0b2c0266b467b365c21376d50dde61a3236722ab87ff1e8dacec283eb610')

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

