# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=pymodbus
pkgname=python-${_name}
pkgver=3.10.0
pkgrel=1
pkgdesc="A fully featured modbus protocol stack in python"
arch=("any")
url="https://github.com/pymodbus-dev/${_name}"
license=("LicenseRef-Custom")
depends=("python")
makedepends=(python-build python-installer python-wheel python-setuptools)
optdepends=("python-pygments" "python-pyserial" "python-prompt_toolkit" "python-click" "python-aiohttp" "python-typer")
source=("v${pkgver}.tar.gz::https://github.com/pymodbus-dev/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("3322d8d23eac1cb3c353e42e7c8b08a2dc1911933c69936bd40280581e9fa669")

build() {
	cd "${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_name}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
