# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-blinka
_pypi_pkgname=adafruit_blinka
pkgver=8.68.0
pkgrel=1
pkgdesc="CircuitPython APIs for non-CircuitPython versions of Python such as CPython on Linux and MicroPython"
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/adafruit/Adafruit_Blinka"
license=('MIT')
makedepends=(
'python-build'
'python-installer'
'python-wheel'
'python-setuptools-scm'
)
depends=(
'python'
'python-sysv_ipc'
'python-adafruit-platformdetect'
'python-gpiod'
'python-adafruit-pureio'
)
optdepends=()
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('7411be4c88ac56412b0fa2f1154bfbe5f93ad3010591a5dc8d7f3bc13ea7bbd8')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${_pypi_pkgname}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/license/$pkgname" LICENSE
}
