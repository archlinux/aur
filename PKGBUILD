# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

# TODO: python-scimath: for unit parser in pyface.wx.spreadsheet
# TODO: look for more hidden dependencies

pkgbase=python-pyface
pkgname=('python2-pyface' 'python-pyface')
pkgver=6.0.0
pkgrel=4
pkgdesc="Traits-capable windowing framework"
arch=('any')
url="https://github.com/enthought/pyface"
license=('BSD')
makedepends=('python-setuptools' 'python-traits' 'python2-setuptools' 'python2-traits')
options=(!emptydirs)

source=("pyface-${pkgver}.tar.gz::https://github.com/enthought/pyface/archive/${pkgver}.tar.gz")
sha1sums=('3f260f9c52044419bb670ee2e9b564d3d4bfeb41')

prepare() {
  cd "$srcdir"
  cp -a pyface-${pkgver} pyface-py2-${pkgver}
}

build() {
  cd "$srcdir"/pyface-py2-$pkgver

  # "Building Python2"
  python2 setup.py build

  cd "$srcdir"/pyface-$pkgver

  # "Building Python3"
  python setup.py build
}

package_python2-pyface() {
  depends=('python2-traits')
  optdepends=('python2-pyqt5: for Qt backend'
              'python2-pyqtwebengine: for Qt backend'
              'python2-pygments: for syntax coloring in Qt backend'
              'python2-setuptools: to locate resources inside zip and egg files'
              'ipython2: for IPython widget'
              'python2-wxpython3: for wx backend')

  cd "$srcdir"/pyface-py2-$pkgver

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python-pyface() {
  depends=('python-traits')
  optdepends=('python-pyqt5: for Qt backend (or pyside2)'
              'python-pyqtwebengine: for Qt backend'
              'pyside2: for Qt backend (or python-pyqt5)'
              'python-pygments: for syntax coloring in Qt backend'
              'python-setuptools: to locate resources inside zip and egg files'
              'ipython: for IPython widget'
	      'python-wxpython: for wx backend')

  cd "$srcdir"/pyface-$pkgver

  python setup.py install --root="$pkgdir"/ --optimize=1

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
