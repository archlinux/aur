# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Hugo Rodrigues <me@hugorodrigues.net>

pkgname=python-minio
pkgver=7.1.4
pkgrel=1
pkgdesc='MinIO Python SDK for Amazon S3 Compatible Cloud Storage'
arch=('any')
url='https://github.com/minio/minio-py'
license=('Apache')
depends=('python-certifi' 'python-urllib3')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-mock' 'python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/m/minio/minio-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/m/minio/minio-$pkgver.tar.gz.asc")
sha256sums=('cea0d0d6fd6cb1361d43e5007126bad5e5e4af2e781c3912aecae66ad46b4aed'
            'SKIP')
validpgpkeys=('4405F3F0DDBA1B9E68A31D2512C74390F9AAC728')

build() {
	cd "minio-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "minio-$pkgver"
	pytest -x
}

package() {
	export PYTHONHASHSEED=0
	cd "minio-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md docs/API.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
