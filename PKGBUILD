# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=jupyterlab-execute-time
pkgdesc="JupyterLab extension to show execution time for each cell"
url='https://github.com/deshaw/jupyterlab-execute-time'
pkgver=2.3.1
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
  'db97e6e7ea80841db524fb8c656e1e2a9533998c5a6082dc63fe818b8f216130'
)

build() {
  cd "$_pypi-$pkgver"
  export NODE_OPTIONS=--openssl-legacy-provider
  python -m build --no-isolation --wheel -x
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
