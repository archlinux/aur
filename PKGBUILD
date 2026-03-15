# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-aioconsole
pkgver=0.8.2
pkgrel=1
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
sha512sums=('9e51e7af0ebb968adcbe1eb73e9e2505c4dc625e8cc9ab803e20edf51d3492b1edaf2c45159666de39a55af07556565fe26536958ed08949955a761772490453')

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
