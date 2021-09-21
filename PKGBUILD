# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-google-resumable-media
_name="${pkgname#python-}"
pkgver=2.0.3
pkgrel=1
pkgdesc="Utilities for Google Media Downloads and Resumable Uploads"
arch=('any')
url="https://github.com/googleapis/google-resumable-media-python"
license=('Apache')
depends=(
	'python>=3.6'
	'python-google-crc32c>=1.0'
	'python-google-crc32c<2')
makedepends=('python-setuptools')
optdepends=(
	'python-requests>=2.18.0: for requests support'
	'python-aiohttp>=3.6.2: for aiohttp support')
# checkdepends=('python-pytest' 'python-google-auth' 'python-requests' 'python-aiohttp')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('abc795a4c9a1dcb1946963aa33c2320fd31bb390c08f99cb6ab4a72bf9a26fcd')

build() {
	cd "$_name-python-$pkgver"
	python setup.py build
}

## requires python-google-test-utils
# check() {
# 	cd "$_name-python-$pkgver"
# 	pytest tests
# }

package() {
	cd "$_name-python-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
	install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
