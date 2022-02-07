# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-google-resumable-media
_name="${pkgname#python-}"
pkgver=2.2.0
pkgrel=1
pkgdesc="Utilities for Google Media Downloads and Resumable Uploads"
arch=('any')
url="https://github.com/googleapis/google-resumable-media-python"
license=('Apache')
depends=('python-google-crc32c')
makedepends=('python-setuptools' 'python-build' 'python-install' 'python-wheel')
optdepends=(
	'python-requests: for requests support'
	'python-aiohttp: for aiohttp support')
# checkdepends=('python-pytest' 'python-google-auth' 'python-requests' 'python-aiohttp')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0c8ff5335d13ee08315e72a4c786819d59d1f2266bf679dfc25403c5c5cfd8f1')

build() {
	cd "$_name-python-$pkgver"
	python -m build --wheel --skip-dependency-check --no-isolation
}

## requires python-google-test-utils
# check() {
# 	cd "$_name-python-$pkgver"
# 	pytest tests
# }

package() {
	export PYTHONHASHSEED=0
	cd "$_name-python-$pkgver"
	python -m install --optimize=1 --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.rst -t "${pkgdir}/usr/share/doc/$pkgname/"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname/"
}
