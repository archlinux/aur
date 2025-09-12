# Maintainer: Vekhir <vekhir AT yahoo DOT com>

pkgname='python-pyffms2'
pkgver=0.5
pkgrel=1
pkgdesc='pyffms2 – Python bindings for FFMS2'
arch=('any')
url='https://github.com/bubblesub/pyffms2/'
license=('LGPL-3.0-or-later')
depends=('python' 'ffms2' 'python-numpy')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
source=("pyffms2-${pkgver}.tar.gz::https://github.com/bubblesub/pyffms2/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b36398a26223ec658687d426ecb6fcaf541517fa230e9721529cc631a18cbd2a')

build() {
  cd pyffms2-${pkgver}/
  python -m build --wheel --no-isolation
}

check() {
  cd pyffms2-${pkgver}/
  export PYTHONPATH="."
  python -m pytest
}

package() {
  cd pyffms2-${pkgver}/
  python -m installer --destdir="$pkgdir" dist/*.whl
}
