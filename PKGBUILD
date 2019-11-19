# Maintainer: Amos Onn <amosonn at gmail dot com>
# Maintainer: Blair Bonnett <blair dot bonnett @ gmail dot com>

pkgname=python-distributed
_pkgname=distributed
pkgver=2.8.0
pkgrel=1
pkgdesc="Python library for distributed computing"
arch=('any')
depends=('python>=3.5' 'python-click>=6.6' 'python-cloudpickle>=0.2.2'
'python-dask>=2.5.2' 'python-msgpack' 'python-psutil>=5.0'
'python-sortedcontainers>2.0.1' 'python-tblib' 'python-toolz>=0.7.4'
'python-tornado>=5' 'python-zict>=0.1.3' 'python-yaml')
optdepends=(
  # Packages suggested in dev-requirements.txt
  'python-joblib: Joblib integration'
  'python-pandas: Pandas integration'
  'python-numpy: NumPy integration'
  'python-bokeh: Interactive visualisation of scheduler tasks'
  'python-pyzmq: Asynchronous messaging with ZeroMQ'
  'python-ipykernel: IPython integration for computing and debugging'
  'python-prometheus_client: Prometheus integration for monitoring and alerting'

  # Packages which have optional unit tests (pytest.importorskip calls)
  'python-keras: Support for the Keras deep learning library'
  'python-lz4: LZ4 compression of messages'
  'python-netcdf4: Support for netCDF4 data files'
  'python-numba: JIT compilation of code'
  'python-h5py: Support for the HDF5 binary data format'
  'python-asyncssh: Computing cluster using SSH communication'
  'python-pytorch: Support for tensors and dynamic neural networks'
  'python-ipywidgets: Extra widgets in diagnostic pages'
)
url="http://distributed.readthedocs.org/en/stable/"
license=('BSD')
source=("$pkgver.tar.gz::https://codeload.github.com/dask/distributed/tar.gz/$pkgver")
sha256sums=('2e9a92877ac31ff292ec24ba4c6f52f6cebc692ece7101f205ffb4dce73d0b4e')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --skip-build --root="$pkgdir" --prefix=/usr --optimize=1
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname"
}
