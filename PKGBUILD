# Maintainer: Jesse R Codling < codling at umich dot edu >
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
_pkgname=aiohttp-zlib-ng
pkgname=python-aiohttp-zlib-ng
pkgver=0.3.2
pkgrel=2
pkgdesc="Enable zlib_ng on aiohttp"
arch=(any)
url="https://github.com/bdraco/aiohttp-zlib-ng"
license=('Apache-2.0')
depends=('python-aiohttp' 'python-zlib-ng')
optdepends=('python-isal')
makedepends=('python-poetry-core' 'python-build' 'python-installer')
checkdepends=('python-pytest-cov')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('466686021fd0628f07af5f922c1e069e3d5fa6c29f42a5825cac119b6af772a8')

build() {
	cd "$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkgname-$pkgver"
	pytest
}

package() {
	cd "$_pkgname-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

