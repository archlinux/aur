# Maintainer: Alessandro Zanatta <alessandro.zanatta.lav@gmail.com>

pkgname=python-pydantic-settings
_pkgname=pydantic-settings
pkgver=2.0.2
pkgrel=1
pkgdesc="Settings management using Pydantic, this is the new official home of Pydantic's BaseSettings."
arch=('x86_64')
url="https://github.com/pydantic/pydantic-settings"
license=('MIT')
depends=(
	python
	python-pip
	python-pydantic
	python-dotenv
)
makedepends=(
	python-build
	python-installer
	python-wheel
	python-hatchling
)
source=(
	"${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
options=(!strip) # strip isn't useful for python files and takes forever
sha256sums=('26522366007579526ae00d35b6e30c57ce262da2a563bc2b6161f27debaed75c')

build() {
	cd "$_pkgname-$pkgver" || exit 1
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname-$pkgver" || exit 1
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
