# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-argopy
pkgdesc='Retrieve and analyse data from the Argo network of ocean profilers'
pkgver=0.1.12
pkgrel=1
arch=('any')
url='https://argopy.readthedocs.io/'
license=('Apache')
depends=(
  'python-aiohttp' 'python-erddapy' 'python-fsspec' 'python-requests'
  'python-scikit-learn' 'python-scipy' 'python-toolz' 'python-xarray'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
optdepends=(
  'jupyterlab: interactive visualization of available data'
  'python-arrow: im-memory big data analytics'
  'python-cartopy: plotting of cartographic data'
  'python-dask: parallel access'
  'python-ipykernel: interactive visualization of available data'
  'python-matplotlib: plotting of profile data'
  'python-seaborn: visualization of statistical data'
  'python-tqdm: progress meters'
)

_pypi=argopy
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  '73451b314c9330231a57c141d5efe2ce5aaeaf9ed896e4a2a804bf6ae1fecfdc'
)

build() {
  cd "$_pypi-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pypi-$pkgver"
  pytest -v -k "not test_chunks_region"
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
