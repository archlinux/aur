# Contributor: Jonatan R. Fischer <jonafischer at gmail dot com>
pkgname=python-junitparser
_name=${pkgname#python-}
pkgver=3.1.2
pkgrel=1
pkgdesc="junitparser handles JUnit/xUnit Result XML files. Use it to parse and manipulate existing Result XML files, or create new JUnit/xUnit result XMLs from scratch."
arch=('any')
url="https://github.com/weiwei/junitparser"
license=('Apache 2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-setuptools-scm'
             'python-pytest' 'python-anyio' 'python-pytest-curio')

source=("${_name}-$pkgver.tar.gz::https://github.com/weiwei/junitparser/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8b02126122427de28c86527ccbf2301bdfdf0c87caadb3f327e7dcadbe9d71b8')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

check() {
  cd $_name-$pkgver
  python -m pytest
}
