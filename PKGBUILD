# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Aseem Athale <athaleaseem@gmail.com>

_name=mathparse
pkgname=python-${_name}
pkgver=0.2.9
pkgrel=1
pkgdesc="A Python library for evaluating natural language mathematical equations."
arch=('any')
url="https://github.com/gunthercox/${_name}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')

source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('9b1073c505cb0cb8320612fede2a6e232681e8ecb76e89fed4eaa93807d3b0c0732f5e3ac130577fca2d3b3a00f7b6838295ab49c59e426516b3dae5d80dd15b')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

