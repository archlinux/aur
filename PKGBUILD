# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname='pyTooling'
pkgname=python-${_pkgname,,}
pkgver=6.0.1
pkgrel=1
pkgdesc="A powerful collection of arbitrary useful classes, decorators, meta-classes and exceptions"
arch=(any)
url="https://github.com/pyTooling/$_pkgname"
license=('Apache-2.0')
depends=('python' 'python-ruamel-yaml' 'python-colorama' 'python-setuptools')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=(
	'python-pytest'
	'python-pytest-cov'
	'python-pytest-benchmark'
	'python-anytree'
	'python-itertree'
	'python-treelib'
	'python-networkx'
	'python-igraph'
	'mypy'
	'python-lxml'
)
replaces=('python-pytooling-packaging' 'python-pymetaclasses' 'python-pyexceptions' 'python-pytooling-terminalui')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ddf01808841d49fc798a2914dc71b53e59000d27409d69b0d9782934b12e7eb3')

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
