# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-google-resumable-media
_name="${pkgname#python-}"
pkgver=2.2.1
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
# checkdepends=(
# 	'python-pytest-runner'
# 	'python-mock'
# 	'python-google-auth'
# 	'python-google-cloud-testutils'
# 	'python-requests'
# 	'python-aiohttp')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c750303924de6fe2d1826874c7ca25882378aa7f7cfc9be36069efb5caf92388')

build() {
	cd "$_name-python-$pkgver"
	python -m build --wheel --skip-dependency-check --no-isolation
}

# requires python-google-test-utils
# check() {
# 	cd "$_name-python-$pkgver"
# 	python setup.py pytest
# }

package() {
	export PYTHONHASHSEED=0
	cd "$_name-python-$pkgver"
	python -m install --optimize=1 --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.rst -t "${pkgdir}/usr/share/doc/$pkgname/"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname/"
}
