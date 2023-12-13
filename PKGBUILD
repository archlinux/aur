# Maintainer: a821
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-google-resumable-media
_pkg="${pkgname#python-}"
pkgver=2.7.0
pkgrel=1
pkgdesc="Utilities for Google Media Downloads and Resumable Uploads"
arch=('any')
url="https://github.com/googleapis/google-resumable-media-python"
license=('Apache')
depends=('python-google-crc32c')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=(
	'python-requests: for requests support'
	'python-aiohttp: for aiohttp support'
	'python-google-auth: for extra functionality')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('5f18f5fa9836f4b083162064a1c2c98c17239bfda9ca50ad970ccf905f3e625b')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

# tests require preset credentials

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dvm644 README.rst -t "${pkgdir}/usr/share/doc/$pkgname/"
}
