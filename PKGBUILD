# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-google-cloud-storage
pkgver=1.43.0
pkgrel=2
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
	'python-requests'
	'python-six')
makedepends=('python-setuptools' 'python-sphinx' 'python-recommonmark')
# checkdepends=('python-pytest-runner' 'python-mock' 'python-google-test-utils')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f6168b8b19fcb5914930bfa90532069d2b76408393c0770f5e6916dadabaea8f')

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
