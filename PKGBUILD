# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>

pkgname=python-meilisearch-sdk
pkgver=4.11.0
epoch=1
pkgrel=1
pkgdesc='An async and sync Python client for the Meilisearch API'
arch=(any)
license=('MIT')
url='https://github.com/sanders41/meilisearch-python-sdk'
depends=(python python-aiofiles python-camel-converter python-httpx python-pydantic python-pyjwt)
makedepends=(python-setuptools python-build python-hatchling python-installer python-wheel)
checkdepends=(python-pytest python-pytest-ordering)
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/sanders41/meilisearch-python-sdk/archive/v${pkgver}.tar.gz")
sha512sums=('e95c2628118efeec6cdfa34a963fd64b75b60efe5c2ecdf21607abbcdee8f538b89b2be388f44cdf88a4b33c4889bcdf1b2572dcf39bf8cfd28a7e4d09961c95')

build() {
	cd "meilisearch-python-sdk-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "meilisearch-python-sdk-${pkgver}"

	python -m installer --destdir="$pkgdir" dist/*.whl
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
