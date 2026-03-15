# Maintainer: a821
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-google-resumable-media
_pkg="google-resumable-media"
pkgver=2.8.1
pkgrel=1
pkgdesc="Utilities for Google Media Downloads and Resumable Uploads"
arch=('any')
url="https://github.com/googleapis/google-cloud-python/tree/main/packages/google-resumable-media"
license=('Apache-2.0')
depends=('python-google-crc32c')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=(
	'python-requests: for requests support'
	'python-aiohttp: for aiohttp support'
	'python-google-auth: for extra functionality')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::https://github.com/googleapis/google-cloud-python/archive/$_pkg-v$pkgver.tar.gz")
sha256sums=('1e0b8516b7d21a875d39f72e266386079920dfed0bb46599644ad10adb9f87db')

build() {
	cd "google-cloud-python-$_pkg-v$pkgver/packages/$_pkg"
	python -m build --wheel --no-isolation
}

# tests require preset credentials

package() {
	cd "google-cloud-python-$_pkg-v$pkgver/packages/$_pkg"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dvm644 README.rst -t "${pkgdir}/usr/share/doc/$pkgname/"
}
