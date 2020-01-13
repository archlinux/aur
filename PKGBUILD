# Maintainer: willemw <willemw12@gmail.com>

pkgname=python-qtpy-git
pkgver=1.9.0.r6.g84f0658
pkgrel=1
pkgdesc="Provides a uniform layer to support PyQt4, PyQt5 and PySide with a single codebase"
arch=('any')
url="https://github.com/spyder-ide/qtpy"
license=('MIT')
depends=('python-pyqt5')
makedepends=('git' 'python-setuptools')
optdepends=('python-pyqt4: Qt-Python bindings'
            'python-pyside: Qt-Python bindings')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=($pkgname::git+$url.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
} 

build() {
  cd $pkgname
  python setup.py build
}

package() {
  cd $pkgname
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

