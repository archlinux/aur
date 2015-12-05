# Maintainer: willemw <willemw12@gmail.com>

_pkgname=python-qtpy
_pkgname2=python2-qtpy
pkgbase=$_pkgname-git
pkgname=($_pkgname-git $_pkgname2-git)
pkgver=0.1.2.r24.gd336f1b
pkgrel=1
pkgdesc="Provides a uniform layer to support PyQt4, PyQt5 and PySide with a single codebase"
arch=('any')
url="https://github.com/spyder-ide/qtpy"
license=('MIT')
makedepends=('python-setuptools' 
             'python2-setuptools'
             'git')
source=($_pkgname::git://github.com/spyder-ide/qtpy.git)
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
} 

prepare() {
  rm -rf $_pkgname2
  cp -a $_pkgname $_pkgname2
}

build() {
  cd "$srcdir/$_pkgname"
  python2 setup.py build

  cd "$srcdir/$_pkgname2"
  python setup.py build
}

package_python-qtpy-git() {
  depends=('python-pyqt5')
  optdepends=('python-pyqt4: Qt-Python bindings'
              'python-pyside: Qt-Python bindings')
  provides=($_pkgname)
  conflicts=($_pkgname)

  cd $_pkgname
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

package_python2-qtpy-git() {
  depends=('python2-pyqt5')
  optdepends=('python2-pyqt4: Qt-Python bindings'
              'python2-pyside: Qt-Python bindings')
  provides=($_pkgname)
  conflicts=($_pkgname)

  cd $_pkgname2
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

