# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>

pkgname=python-meilisearch-sdk
pkgver=7.3.0
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
sha512sums=('c10d3f03a005ed55b5be8d022b07b1d315da4ff78b3d36d37510ca2a0daeefc5d89ff86c7fa8187e76f25fc6888435ac48183e0737c5fa62783ede01a0c02dc0')

build() {
	cd "meilisearch-python-sdk-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "meilisearch-python-sdk-${pkgver}"

	python -m installer --destdir="$pkgdir" dist/*.whl
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
