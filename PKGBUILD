# Contributor: Jonatan R. Fischer <jonafischer at gmail dot com>
pkgname=python-canopen
_name=${pkgname#python-}
pkgver=2.3.0
pkgrel=1
pkgdesc="A Python implementation of the CANopen standard."
arch=('any')
url="https://github.com/christiansandberg/canopen"
license=('MIT')
depends=('python' 'python-can' 'python-msgpack' 'python-wrapt')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-setuptools-scm'
             'python-anyio' 'python-pytest' 'python-pytest-cov' 'python-pytest-mock' 'python-pytest-timeout' 'python-pytest-curio')

source=("${_name}-$pkgver.tar.gz::https://github.com/christiansandberg/canopen/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f53f848ed491eb60d4e10a1ccf02ec3989cf066cae0fc4ff4d2ae71f2bd5dde6')

build() {
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

check(){
    cd $_name-$pkgver

    # Run test suite
    python -m pytest
}
