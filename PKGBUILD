# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=pymodbus
pkgname=python-${_name}
pkgver=3.5.4
pkgrel=1
pkgdesc="A fully featured modbus protocol stack in python"
arch=('any')
url="https://github.com/pymodbus-dev/${_name}"
license=('BSD')
depends=('python')
optdepends=('python-pygments' 'python-pyserial' 'python-prompt_toolkit' 'python-click' 'python-aiohttp' 'python-typer')
source=("v$pkgver.tar.gz::https://github.com/pymodbus-dev/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('70d4325c7c0ae8dd25373f9ceeef9d9fe881ef49f56cd6145d42f21be4f6d658')

build() {
	cd "${_name}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
