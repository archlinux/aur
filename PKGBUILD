# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>

pkgname=python-meilisearch-sdk
pkgver=4.7.2
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
sha512sums=('3df4c227c6f626cc39bbc6c494bc047231034067934901a51314a0b1d73ed1282fb4cc30e25611b097fcc44ab207e14ff60fb29d31742936179969eedfb25be1')

build() {
	cd "meilisearch-python-sdk-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "meilisearch-python-sdk-${pkgver}"

	python -m installer --destdir="$pkgdir" dist/*.whl
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
