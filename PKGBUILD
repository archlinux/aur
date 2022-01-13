# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-google-cloud-storage
pkgver=2.0.0
pkgrel=1
pkgdesc='Google Cloud Storage API client library'
arch=('any')
url='https://github.com/googleapis/python-storage'
license=('Apache')
depends=(
	'python-google-api-core'
	'python-google-auth'
	'python-google-cloud-core'
	'python-google-resumable-media'
	'python-protobuf'
	'python-requests')
makedepends=('python-setuptools' 'python-sphinx' 'python-recommonmark')
# checkdepends=('python-pytest-runner' 'python-mock' 'python-google-cloud-testutils')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('74dc5e63db5223067145516e452c06dbf4493f58c7ac4de7718ca3a432b95250')

build() {
	cd "python-storage-$pkgver"
	python setup.py build
	cd docs
	PYTHONPATH=../ sphinx-build -b man ./ build
}

# check() {
# 	cd "python-storage-$pkgver"
# 	python setup.py pytest
# }

package() {
	cd "python-storage-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 SECURITY.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 docs/build/google-cloud-storage.1 -t "$pkgdir/usr/share/man/man1/"
}
