# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: entriphy <t4ils.dev@gmail.com>

_pkgname=asyncprawcore
pkgname=python-$_pkgname
pkgver=3.1.0
pkgrel=1
pkgdesc="Low-level asynchronous communication layer for Async PRAW"
arch=("any")
url="https://github.com/praw-dev/$_pkgname"
license=('BSD-2-Clause')
options=(!emptydirs)
depends=('python')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel' 'python-flit-core')
checkdepends=(
	'python-aiohttp' 'python-coverage' 'pyright' 'python-pytest' 'python-pytest-asyncio'
	'python-pytest-vcr' 'python-urllib3' 'python-vcrpy')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b4fd8c0886e79fe4e4247bf9499643b9047f5ca67019d734a786e353838333b9')

_srcdir="${_pkgname}-${pkgver}"

build() {
	cd "$_srcdir"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_srcdir"
	pytest
}

package() {
	depends+=('python-aiohttp' 'python-yarl')

	cd "$_srcdir"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
