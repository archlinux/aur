# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=pymodbus
pkgname=python-${_name}
pkgver=3.16.1
pkgrel=1
pkgdesc="A fully featured modbus protocol stack in python"
arch=("any")
url="https://github.com/pymodbus-dev/${_name}"
license=("LicenseRef-Custom")
depends=("python")
makedepends=(python-build python-installer python-wheel python-setuptools)
optdepends=("python-pygments" "python-pyserial" "python-prompt_toolkit" "python-click" "python-aiohttp" "python-typer")
source=("v${pkgver}.tar.gz::https://github.com/pymodbus-dev/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8f5981c171280013befd382d72c0ea7faa1bbc2bb93cfb4a114aaf88403a4797')

build() {
	cd "${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_name}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
