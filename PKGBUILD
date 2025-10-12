# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_base=mathparse
pkgname=python-${_base}
pkgver=0.2.5
pkgrel=1
pkgdesc="A Python library for evaluating natural language mathematical equations."
arch=('any')
url="https://github.com/gunthercox/${_base}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('bcbb946e2f70a284a0e3ab08f38d1eda8723208cbaeccb3173849c0af9843c654e055b49198193b74e03ccc72a53c1f5a39f15650f36337e75216ae8aee20575')

build() {
  cd "${_base}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_base}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
