# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Bruno Pagani <archange@archlinux.org>

_pkg=dask
pkgname=python38-${_pkg}
pkgver=2022.10.2
pkgrel=1
pkgdesc="Parallel computing with task scheduling"
arch=(any)
url="https://dask.org"
license=(BSD)
makedepends=(python38-setuptools)
depends=(python38 python38-cloudpickle python38-fsspec python38-packaging python38-partd python38-toolz python38-yaml mpdecimal)
optdepends=(
#    'python38-bokeh: visualizing dask diagnostics'
#    'python38-cityhash: faster hashing of arrays'
    'python38-distributed: distributed computing'
#    'python38-fastparquet: storing and reading data from parquet files'
#    'python38-gcsfs: file-system interface to Google Cloud Storage'
#    'python38-jinja: diagnostics'
#    'python38-murmurhash: faster hashing of arrays'
    'python38-numpy: arrays and dataframes support'
    'python38-pandas: dataframes support'
    'python38-psutil: more accurate CPU count'
    'python38-pyarrow: Apache Arrow, for parquet support'
#    'python38-s3fs: Amazon S3 support'
    'python38-sqlalchemy: writing and reading from SQL databases'
    'python38-xxhash: faster hashing of arrays'
)
checkdepends=(
    python38-ipython
    python38-pytest
    python38-pytest-rerunfailures
    python38-aiohttp
#    python38-bokeh
    python38-boto3
    python38-botocore
    python38-cytoolz
#    python38-cityhash
    python38-distributed
#    python38-fastparquet
#    python38-gcsfs
    python38-graphviz
    python38-h5py
    python38-httpretty
    python38-jinja
    python38-jsonschema
    python38-lz4
    python38-matplotlib
    python38-moto
#    python38-murmurhash
#    python38-numba
    python38-numexpr
    python38-numpy
    python38-pandas
    python38-psutil
    python38-pyarrow
    python38-pytables
    python38-requests
#    python38-s3fs
    python38-scikit-learn
    python38-scipy
    python38-snappy
#    python38-sparse
    python38-sqlalchemy
    python38-xarray
    python38-xxhash
)
#source=(https://files.pythonhosted.org/packages/source/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz)
source=(https://github.com/dask/dask/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('db9a61f1e7197a9b800c4a4da8cf7b3eeab0e1cf9b669d9a57ce3637dc2692e1')

build() {
  cd ${_pkg}-${pkgver}
  python3.8 setup.py build
}

check() {
  cd ${_pkg}-${pkgver}
  pytest -vvrsfE --color=yes dask/tests dask/array/tests dask/bag/tests dask/bytes/tests dask/dataframe/tests -W 'ignore:There is no current event loop:DeprecationWarning'
}

package() {
  cd ${_pkg}-${pkgver}
  python3.8 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
