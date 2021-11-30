# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Hugo Rodrigues <me@hugorodrigues.net>

pkgname=python-minio
pkgver=7.1.2
pkgrel=1
pkgdesc='MinIO Python SDK for Amazon S3 Compatible Cloud Storage'
arch=('any')
url='https://github.com/minio/minio-py'
license=('Apache')
depends=('python-certifi' 'python-urllib3')
makedepends=('python-setuptools')
checkdepends=('python-mock' 'python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/m/minio/minio-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://files.pythonhosted.org/packages/source/m/minio/minio-$pkgver.tar.gz.asc")
sha256sums=('40d0cdb4dba5d5610d6599ea740cf827102db5bfa71279fc220c3cf7305bedc1'
            'SKIP')
validpgpkeys=('4405F3F0DDBA1B9E68A31D2512C74390F9AAC728')

build() {
	cd "minio-$pkgver"
	python setup.py build
}

check() {
	cd "minio-$pkgver"
	pytest -x
}

package() {
	cd "minio-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 README.md docs/API.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
