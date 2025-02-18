# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-bflb-iot-tool
_name=${pkgname#python-}
pkgver=1.10.0
pkgrel=1
pkgdesc="BOUFFALOLAB IOT TOOL"
arch=('any')
url="https://pypi.org/project/bflb-iot-tool"
license=('MIT')
groups=()
_pydeps=(
    ecdsa
    six
    pycryptodome
    pylink-square
    pyserial)
depends=(
    gcc-libs
    glibc
    libusb
    python
    "${_pydeps[@]/#/python-}"
    #AUR
    python-bflb-crypto-plus
    python-pycklink
    python-portalocker
)
_pymakedeps=(
    build
    installer
    wheel
    setuptools)
makedepends=(
    "${_pymakedeps[@]/#/python-}")
options=('!strip')
optdepends=("jlink-software-and-documentation: Segger JLink software & documentation pack for Linux")
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('9154e15533bdfd77c40f1d1fcd19a268510a9a1cd39518c94be98500897a0608')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf bflb_iot_tool/utils/jlink
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
