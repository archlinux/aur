# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-adafruit-blinka
_pypi_pkgname=Adafruit-Blinka
pkgver=3.7.1
pkgrel=0
pkgdesc="CircuitPython APIs for non-CircuitPython versions of Python such as CPython on Linux and MicroPython"
arch=('armv6h' 'armv7h')
url="https://github.com/adafruit/Adafruit_Blinka"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-adafruit-platformdetect')
optdepends=('python-raspberry-gpio')
source=("https://pypi.io/packages/source/A/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('85dc7b3817079d90ccbc5d97ec00f8d361033e02e508cb5edac7974c7a256502')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
