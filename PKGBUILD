# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=mathparse
pkgname=python-${_base}
pkgver=0.2.2
pkgrel=1
pkgdesc="A Python library for evaluating natural language mathematical equations."
arch=('any')
url="https://github.com/gunthercox/${_base}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('64edf8b86ecb6b9181f733482ea55e3e2e5b32b0e4c83f19bf304131b80bdefbff40a24099835eb87061301c00661481f27fed55817987f01a9cacd87158bfd7')

build() {
  cd "${_base}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_base}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
