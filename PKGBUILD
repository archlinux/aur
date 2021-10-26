# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-google-resumable-media
_name="${pkgname#python-}"
pkgver=2.1.0
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
sha256sums=('7d84a05843ca7081ff9851598448bb0497165d2cf2a6c78fb4d10683d8348a19')

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
