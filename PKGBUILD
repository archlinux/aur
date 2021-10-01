# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-google-cloud-storage
pkgver=1.42.3
pkgrel=1
pkgdesc='Google Cloud Storage API client library'
arch=('any')
url='https://github.com/googleapis/python-storage'
license=('Apache')
depends=(
	'python>=3.6'
	'python-google-api-core>=1.29.0'
	'python-google-auth>=1.25'
	'python-google-cloud-core>=1.6.0'
	'python-google-resumable-media>=1.3.0'
	'python-protobuf'
	'python-requests>=2.18.0'
	'python-six')
makedepends=('python-setuptools' 'python-sphinx' 'python-recommonmark')
# checkdepends=('python-pytest-runner' 'python-mock' 'python-google-test-utils')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::https://github.com/googleapis/python-storage/archive/v$pkgver.tar.gz")
sha256sums=('c9381af1fb2f26c62bd9233121b59bbd083683d6834e8586069ef66ae7a99fb2')

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
	install -Dm 644 SECURITY.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm 644 docs/build/google-cloud-storage.1 -t "$pkgdir/usr/share/man/man1/"
}
