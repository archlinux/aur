# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-aioconsole
pkgver=0.9.0
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
sha512sums=('6f168d26fdd67753dcd5dbfa7e5738c6d3f0b680c24047d475afe25b18bc31190c1769b9270fb16cb57d62614e27a0929c7b4f5ecdf96632d72bf65690092012')

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
