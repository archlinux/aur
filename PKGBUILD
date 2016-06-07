# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

# TODO: python-scimath: for unit parser in pyface.wx.spreadsheet
# TODO: look for more hidden dependencies

pkgbase=python-pyface
pkgname=('python2-pyface' 'python-pyface')
pkgver=5.1.0
pkgrel=1
pkgdesc="Traits-capable windowing framework"
arch=('any')
url="https://github.com/enthought/pyface"
license=('BSD')
makedepends=('python-setuptools' 'python-traits' 'python2-setuptools' 'python2-traits')
options=(!emptydirs)

source=("pyface-${pkgver}.tar.gz::https://github.com/enthought/pyface/archive/${pkgver}.tar.gz")
md5sums=('2d7703b71df4478ae02b7481dc673754')

prepare() {
  cd "$srcdir"
  #patch -p0 < ipython_widget.patch
  cp -a pyface-${pkgver} pyface-py2-${pkgver}
}

build() {
  cd "$srcdir"/pyface-py2-$pkgver

  msg "Building Python2"
  python2 setup.py build

  cd "$srcdir"/pyface-$pkgver

  msg "Building Python3"
  python setup.py build
}

package_python2-pyface() {
  depends=('python2-traits')
  optdepends=('python2-pyqt4: for Qt backend (or python2-pyside)'
              'python2-pyside: for Qt backend (or python2-pyqt4)'
              'python2-pygments: for syntax coloring in Qt backend'
              'python2-setuptools: to locate resources inside zip and egg files'
              'ipython2: for IPython widget'
              'wxpython: for wx backend')

  cd "$srcdir"/pyface-py2-$pkgver

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python-pyface() {
  depends=('python-traits')
  optdepends=('python-pyqt4: for Qt backend (or python2-pyside)'
              'python-pyside: for Qt backend (or python2-pyqt4)'
              'python-pygments: for syntax coloring in Qt backend'
              'python-setuptools: to locate resources inside zip and egg files'
              'ipython: for IPython widget')

  cd "$srcdir"/pyface-$pkgver

  python setup.py install --root="$pkgdir"/ --optimize=1

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
