# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>

pkgname=python-meilisearch-sdk
pkgver=4.10.1
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
sha512sums=('989f1aa7a759cad10fac561358c4d64b08fc31a09a4e26b765e4113a0464198e5eace167efb131ae801eef66555e0f2896ecfb7daf9d5e9f5bfaf9ddebe0eb3f')

build() {
	cd "meilisearch-python-sdk-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "meilisearch-python-sdk-${pkgver}"

	python -m installer --destdir="$pkgdir" dist/*.whl
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
