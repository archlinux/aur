# Contributor inemum (https://gitlab.com/inemum)
# Maintainer graysky <graysky AT archlinux DOT us>
# based on https://git.archlinux.org/svntogit/packages.git/tree/trunk/PKGBUILD?h=packages/sip

pkgname=('python-sip-pyqt4')
pkgver=4.19.16
pkgrel=1
arch=('x86_64')
url='http://www.riverbankcomputing.com/software/sip/intro'
license=('custom:"sip"')
makedepends=('python')
source=("https://www.riverbankcomputing.com/static/Downloads/sip/$pkgver/sip-$pkgver.tar.gz")
sha256sums=('184c790d58e9527fc6bdac2bbf8638f3d1b41dea922cad8eb83172b4ba70c620')

prepare() {
  mkdir -p build-pyqt4
}

build() {
  cd "$srcdir"/build-pyqt4
  python ../sip-$pkgver/configure.py CFLAGS="$CFLAGS" LFLAGS="$LDFLAGS" --sip-module PyQt4.sip --no-tools
  make
}

package_python-sip-pyqt4() {
  pkgdesc="Python 3.x SIP bindings for C and C++ libraries (PyQt4 version)"
  depends=('python')

  cd build-pyqt4
  make DESTDIR="$pkgdir" install

  install -Dm644 ../sip-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
