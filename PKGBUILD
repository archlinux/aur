# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-google-resumable-media
_name="${pkgname#python-}"
pkgver=2.3.2
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
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1cb9fd19cc3c31c6e66bba7ac5f1dd75ec3d3b12b50c8d4cf4cfecf9c60c9562')

build() {
	cd "$_name-python-$pkgver"
	python -m build --wheel --no-isolation
}

# tests require preset credentials

package() {
	export PYTHONHASHSEED=0
	cd "$_name-python-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.rst -t "${pkgdir}/usr/share/doc/$pkgname/"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/$pkgname/"
}
