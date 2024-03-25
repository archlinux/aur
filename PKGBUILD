# Maintainer: Rafael Silva <perigoso@riseup.net>

_modulename='xpi2pkgbuild'
pkgname="python-${_modulename}"
pkgver=1.1.0
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
source=("https://files.pythonhosted.org/packages/source/${_modulename::1}/${_modulename}/${_modulename}-${pkgver}.tar.gz")
b2sums=('86ce5c34d4f4f2886a0ab40586a546582ed6ae565bb71e48142ff89bf8ad4e72bdfda8b10e69d93b2fea9b1ec015be50724fafa67508734cdec2161d5189e7db')

build() {
  cd "${_modulename}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${_modulename}-${pkgver}"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
