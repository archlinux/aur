# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>

pkgname=python-meilisearch-sdk
pkgver=4.9.0
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
sha512sums=('777109fefa3e7b27f4d20154802b8c2e5a5d94e1c092d225fbfa0c95891ca0e7b0cc0b4d3c0c3950d221a938ecb555a2d6634658c696075ac88bd14f03951f5c')

build() {
	cd "meilisearch-python-sdk-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "meilisearch-python-sdk-${pkgver}"

	python -m installer --destdir="$pkgdir" dist/*.whl
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
