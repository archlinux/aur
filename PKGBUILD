# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-aioconsole
pkgver=0.8.1
pkgrel=3
pkgdesc="Asynchronous console and interfaces for asyncio"
url="https://github.com/vxgmichel/aioconsole"
license=('GPL')
arch=('any')
depends=('python')
makedepends=(
	'python-setuptools'
	'python-installer'
	'python-wheel'
	'python-build'
)
optdepends=(
	'python-pytest'
	'python-pytest-cov'
	'python-uvloop'
)
checkdepends=(
	'python-pytest-asyncio'
	'python-pytest-repeat'
)
source=("https://pypi.io/packages/source/a/aioconsole/aioconsole-${pkgver}.tar.gz")
sha512sums=('7e0719697bc6e7a7c6f1eb3bd0757e37145b66b0f4be211b7989a38f28d908778de3e198ccfe7521256e6fd0cec28b3c93bb054f65024f733f7bd239a8b48b75')

build() {
  cd aioconsole-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd aioconsole-$pkgver
  python -m pytest -o addopts=''
}

package() {
  cd aioconsole-$pkgver
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
