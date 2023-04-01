# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-argopy
pkgdesc='Retrieve and analyse data from the Argo network of ocean profilers'
pkgver=0.1.13
pkgrel=1
arch=('any')
url='https://argopy.readthedocs.io/'
license=('Apache')
depends=(
  'python-aiohttp' 'python-erddapy' 'python-fsspec' 'python-requests'
  'python-scipy' 'python-toolz' 'python-xarray'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-localftpserver')
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
  '41baa3dd92b298562ec51a52bacc37956e6b286b8d1e77fb2b39e3c170a3c1f5'
)

build() {
  cd "$_pypi-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pypi-$pkgver"
  pytest -v -k "not test_chunks_region and not test_open_mfdataset"
}

package() {
  cd "$_pypi-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
