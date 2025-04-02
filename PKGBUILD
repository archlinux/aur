# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

_pkgname='pyTooling'
pkgname=python-${_pkgname,,}
pkgver=8.3.0
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
	'mypy'
	'python-typing_extensions'
	'python-lxml'
	'python-ruamel-yaml'
	'python-colorama'
	'git'
)
replaces=('python-pytooling-packaging' 'python-pymetaclasses' 'python-pyexceptions' 'python-pytooling-terminalui')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('914efc01dabca60251867ebe0b8dbaa975f0da4f0f7f572b35632b7d973e0746')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check(){
  cd "$_pkgname-$pkgver"
  pytest --ignore tests/performance --ignore tests/benchmark tests/
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
