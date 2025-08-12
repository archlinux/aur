# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: entriphy <t4ils.dev@gmail.com>

_pkgname=asyncprawcore
pkgname=python-$_pkgname
pkgver=3.0.2
pkgrel=1
pkgdesc="Low-level asynchronous communication layer for Async PRAW"
arch=("any")
url="https://github.com/praw-dev/$_pkgname"
license=('BSD-2-Clause')
options=(!emptydirs)
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-flit-core')
#checkdepends=(
#	'python-aiohttp' 'python-coverage' 'pyright' 'python-pytest' 'python-pytest-asyncio'
#	'python-pytest-vcr' 'python-urllib3' 'python-vcrpy')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8d0612004b7434377c46253955a137985e2c1a50120404815a25ce097b235423')

_srcdir="${_pkgname}-${pkgver}"

build() {
	cd "$_srcdir"
	python -m build --wheel --no-isolation
}

#check() {
#	cd "$_srcdir"
#	pytest
#}

package() {
	depends+=('python-aiohttp' 'python-yarl')

	cd "$_srcdir"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
