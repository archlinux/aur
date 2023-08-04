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
checkdepends=(
	python-pytest
)
makedepends=(
	python-build
	python-installer
	python-wheel
	python-hatchling
)
source=(
	"https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/pydantic_settings-${pkgver}.tar.gz"
)
options=(!strip) # strip isn't useful for python files and takes forever
sha256sums=('342337fff50b23585e807a86dec85037900972364435c55c2fc00d16ff080539')

build() {
	cd "pydantic_settings-$pkgver" || exit 1
	python -m build --wheel --no-isolation
}

check() {
	cd "pydantic_settings-$pkgver" || exit 1
	pytest
}

package() {
	cd "pydantic_settings-$pkgver" || exit 1
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
