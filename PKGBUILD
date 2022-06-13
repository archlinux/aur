# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname='pyTooling'
pkgname=python-${_pkgname,,}
pkgver=2.0.1
pkgrel=1
pkgdesc="A powerful collection of arbitrary useful classes, decorators, meta-classes and exceptions"
arch=(any)
url="https://github.com/pyTooling/$_pkgname"
license=('Apache')
depends=('python' 'python-ruamel-yaml')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=(
	'python-pytest-benchmark'
	'python-pytest'
	'python-anytree'
	'python-itertree'
	'python-numpy'
)
replaces=('python-pytooling-packaging' 'python-pymetaclasses' 'python-pyexceptions')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('bf6ed333992590257a472ecf98d2a94c2652d30228a7f80c6ae067f795d9a6e9')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check(){
  cd "$_pkgname-$pkgver"
  # testsuite runs performance tests for 5 minutes
  #pytest tests/
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
