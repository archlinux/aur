# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>
#
_name=repl
pkgname=python-pymodbus-${_name}
pkgver=2.0.3
pkgrel=1
pkgdesc="Pymodbus REPL: a REPL tool for the Pymodbus library."
arch=("any")
url="https://github.com/pymodbus-dev/${_name}"
license=("MIT")
depends=("python" "python-pymodbus" "python-typer" "python-prompt_toolkit" "python-pygments" "python-tabulate" "python-aiohttp")
makedepends=("python-installer" "python-wheel" "python-setuptools" "python-build" "python-poetry-core")
source=("${pkgver}.tar.gz::https://github.com/pymodbus-dev/${_name}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("17af55572c22f0e2779037b3e51bf434408f4bb81b1b9e2bbf5fe8ba5acc7b66")

build() {
	cd "${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_name}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
