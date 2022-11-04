# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterlab-execute-time
pkgdesc="JupyterLab extension to show execution time for each cell"
url='https://github.com/deshaw/jupyterlab-execute-time'
pkgver=2.3.0
pkgrel=1
license=('BSD')
arch=('any')
depends=('jupyterlab' 'jupyter-notebook')
makedepends=(
  'python-build' 'python-installer' 'python-jupyter_packaging'
  'python-setuptools' 'python-wheel'
)

_pypi=jupyterlab_execute_time
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  '652126f4fbb897bfcae0c528ab49d928348af1a050a714ebdd45436cc5d7e7e5'
)

build() {
  cd "$_pypi-$pkgver"
  python -m build --no-isolation --wheel
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
