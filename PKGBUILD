# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python38-ipywidgets
_pipname=ipywidgets
pkgver=8.0.2
pkgrel=1
pkgdesc="IPython HTML widgets for Jupyter"
arch=('any')
url="https://github.com/ipython/ipywidgets"
license=('BSD')
depends=('python38-ipykernel' 'python38-jsonschema' 'python38-ipython-genutils')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools' 'python38-wheel')
optdepends=('jupyterlab-widgets: widgets for Jupyter lab' 'jupyter-widgetsnbextension: widgets for the legacy notebook')
checkdepends=('python38-pytest' 'python38-pytz')
source=(https://pypi.io/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz)
sha256sums=('08cb75c6e0a96836147cbfdc55580ae04d13e05d26ffbc377b4e1c68baa28b1f')

build() {
  cd ipywidgets-$pkgver
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd ipywidgets-$pkgver
  pytest -v
}

package() {
  cd ipywidgets-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
