# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

# TODO: python-scimath: for unit parser in pyface.wx.spreadsheet
# TODO: look for more hidden dependencies

pkgname=python-pyface
pkgver=8.0.0
pkgrel=2
pkgdesc="Traits-capable windowing framework"
arch=('any')
url="https://github.com/enthought/pyface"
license=('BSD')
depends=('python-traits')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('python-pyqt6: for Qt backend (or pyside2)'
            'python-pyqt6-webengine: for Qt backend'
            'pyside6: for Qt backend (or python-pyqt5)'
            'python-pygments: for syntax coloring in Qt backend'
            'ipython: for IPython widget'
            'python-wxpython: for wx backend')
options=(!emptydirs)
source=("pyface-${pkgver}.tar.gz::https://github.com/enthought/pyface/archive/${pkgver}.tar.gz")
sha256sums=('e34f8fb285517e25bfe41a4b8d1d54860d2636bd5fa5b9bff26ab96c1a098895')

build() {
  cd pyface-$pkgver

  python -m build --wheel --no-isolation
}

package() {
  cd pyface-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
