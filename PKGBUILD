# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=mathparse
pkgname=python-${_base}
pkgver=0.2.7
pkgrel=1
pkgdesc="A Python library for evaluating natural language mathematical equations."
arch=('any')
url="https://github.com/gunthercox/${_base}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('851f317f63d2d82aab01bd1992612929e86b64b05f1c8c140bc4801141abce0a6092aa06a85d22b81eedb73f0e1ba8a8297f7dbacd728de7ef10deaeeff5810b')

build() {
  cd "${_base}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_base}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
