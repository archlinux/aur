# Maintainer: Bruno Pagani <archange@archlinux.org>

_pkg=distributed
pkgname=python38-${_pkg}
pkgver=2022.10.2
pkgrel=1
pkgdesc="Distributed task scheduler for Dask"
arch=(x86_64)
url="https://distributed.dask.org/"
license=(BSD)
depends=(
    python38
    python38-click
    python38-cloudpickle
    python38-dask
    python38-jinja
    python38-msgpack
    python38-packaging
    python38-psutil
    python38-sortedcontainers
    python38-tblib
    python38-toolz
    python38-tornado
    python38-urllib3
    python38-yaml
    python38-zict
)
checkdepends=(python38-ipython
    python38-pytest
    python38-pytest-repeat
    python38-pytest-timeout
    python38-flaky
    python38-blosc
    python38-cryptography
    python38-distributed
    python38-fsspec
    python38-h5py
    python38-ipykernel
    python38-ipywidgets
    python38-jsonschema
    python38-locket
    python38-lz4
    python38-netcdf4
    python38-numpy
    python38-pandas
    python38-paramiko
    python38-prometheus_client
    python38-pyarrow
    python38-pytorch
    python38-requests
    python38-scipy
    python38-snappy
    python38-zstandard
)
# No tests in PyPi tarballs
#source=(https://files.pythonhosted.org/packages/source/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz)
source=(https://github.com/dask/distributed/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('fa53031dbe4850cc671699b4c4a2ac8e697af9921b082c5490c6dc6ebfb5cd03')

build() {
  cd ${_pkg}-${pkgver}
  python3.8 setup.py build
}

# Not collecting properly, no time to investigate
#check() {
#  cd ${_pkg}-${pkgver}
#  pytest -vvrsfE --color=yes distributed -m "not avoid_ci"
#}

package() {
  cd ${_pkg}-${pkgver}
  python3.8 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
