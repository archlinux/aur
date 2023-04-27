# Maintainer: Rafael Silva <perigoso@riseup.net>

_modulename='xpi2pkgbuild'
pkgname="python-${_modulename}"
pkgver=1.0.0
pkgrel=1
pkgdesc='Mozilla XPI based PKGBUILD generator using mozilla addon API.'
arch=('any')
url='https://github.com/perigoso/xpi2pkgbuild'
license=('MIT')
makedepends=(
  'python-flit'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
source=("${_modulename}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_modulename::1}/${_modulename}/${_modulename}-${pkgver}.tar.gz")
b2sums=('83c7da4d2b13bb3c8f9c72e6c6f2c188c82ecb1b2b93e1c90b795a6aca705e6dec5e2f07e70ed3b189e072b61eba798f577b04873622610e702e045eb141a895')

build() {
  cd "${_modulename}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${_modulename}-${pkgver}"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
