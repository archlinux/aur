# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=pymodbus
pkgname=python-${_name}
pkgver=3.11.1
pkgrel=1
pkgdesc="A fully featured modbus protocol stack in python"
arch=("any")
url="https://github.com/pymodbus-dev/${_name}"
license=("LicenseRef-Custom")
depends=("python")
makedepends=(python-build python-installer python-wheel python-setuptools)
optdepends=("python-pygments" "python-pyserial" "python-prompt_toolkit" "python-click" "python-aiohttp" "python-typer")
source=("v${pkgver}.tar.gz::https://github.com/pymodbus-dev/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("cb5610be4494904e7d22e0661eac0f6ffd33e82fb1fd566b281860edd798fb82")

build() {
	cd "${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_name}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
