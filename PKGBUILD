# Maintainer: Yakov Till <yakov.till@gmail.com>

_name=crytic_compile
pkgname=python-crytic-compile
pkgver=0.3.11
pkgrel=1
pkgdesc='Abstraction layer for smart contract build systems'
arch=(any)
url='https://github.com/crytic/crytic-compile'
license=('AGPL-3.0-only')
depends=(
  'python>=3.8'
  python-cbor2
  python-pycryptodome
  python-solc-select
)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/c/crytic-compile/${_name}-${pkgver}.tar.gz")
sha256sums=('d4e2253d5d81ec3a75deb3ab9fc2c2d2db56e835001cf07f3703911d74b56716')

build() {
  cd "$srcdir/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
