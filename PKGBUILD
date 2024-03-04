# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=pymodbus
pkgname=python-${_name}
pkgver=3.6.5
pkgrel=1
pkgdesc="A fully featured modbus protocol stack in python"
arch=("any")
url="https://github.com/pymodbus-dev/${_name}"
license=("BSD")
depends=("python")
optdepends=("python-pygments" "python-pyserial" "python-prompt_toolkit" "python-click" "python-aiohttp" "python-typer")
source=("v${pkgver}.tar.gz::https://github.com/pymodbus-dev/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("3ed2cb6714b3341d07092411b8d8d59e49f0391df654ba6779e2ec4baa5a4825")

build() {
	cd "${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_name}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
