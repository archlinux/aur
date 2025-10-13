# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=mathparse
pkgname=python-${_base}
pkgver=0.2.6
pkgrel=1
pkgdesc="A Python library for evaluating natural language mathematical equations."
arch=('any')
url="https://github.com/gunthercox/${_base}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('7db9feba994d86ccc96d752ff91fbd31d866826479a9b619d71d4547763794f487318f0ed108086cecd9900d4c6f00c300f39fff375a95f8cd65abd7e6ca7676')

build() {
  cd "${_base}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_base}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
