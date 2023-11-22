# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-blinka
_pypi_pkgname=Adafruit-Blinka
pkgver=8.25.0
pkgrel=0
pkgdesc="CircuitPython APIs for non-CircuitPython versions of Python such as CPython on Linux and MicroPython"
arch=('armv6h' 'armv7h' 'aarch64')
url="https://github.com/adafruit/Adafruit_Blinka"
license=('MIT')
makedepends=(
'python-build'
'python-installer'
'python-wheel'
'python-setuptools-scm'
)
depends=(
'libgpiod'
'python'
'python-sysv_ipc'
'python-adafruit-platformdetect'
'python-adafruit-pureio'
)
optdepends=()
source=("https://pypi.io/packages/source/A/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('4cae1655a60c341d97e59108c0fa4f3963e8373b6195381e3b7f76ce1f4c2a5b')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_pypi_pkgname}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/license/$pkgname" LICENSE
}
