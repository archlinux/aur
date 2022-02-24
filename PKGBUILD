# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-google-resumable-media
_name="${pkgname#python-}"
pkgver=2.3.0
pkgrel=1
pkgdesc="Utilities for Google Media Downloads and Resumable Uploads"
arch=('any')
url="https://github.com/googleapis/google-resumable-media-python"
license=('Apache')
depends=('python-google-crc32c')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=(
	'python-requests: for requests support'
	'python-aiohttp: for aiohttp support')
# checkdepends=(
# 	'python-pytest-runner'
# 	'python-mock'
# 	'python-google-auth'
# 	'python-google-cloud-testutils'
# 	'python-requests'
# 	'python-aiohttp')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('53b87211a09046a60b40f8a1b26995536421dab4d939d3751dfaac109b0eaed7')

build() {
	cd "$_name-python-$pkgver"
	python -m build --wheel --no-isolation
}

# requires python-google-test-utils
# check() {
# 	cd "$_name-python-$pkgver"
# 	python setup.py pytest
# }

package() {
	export PYTHONHASHSEED=0
	cd "$_name-python-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.rst -t "${pkgdir}/usr/share/doc/$pkgname/"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname/"
}
