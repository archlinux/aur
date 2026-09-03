# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-bflb-iot-tool-uart
_name=${pkgname#python-}
pkgver=1.10.0
pkgrel=1
pkgdesc="Bouffalolab Iot Tool uart"
arch=('any')
url="https://pypi.org/project/${_name}"
license=('MIT')
groups=()
_pydeps=(
    cryptography
    pylink-square
    pyserial
    standard-telnetlib
)
depends=(
    pyside6
    python
    "${_pydeps[@]/#/python-}"
    #AUR
    python-pycklink
    python-portalocker
)
_pymakedeps=(
    build
    installer
    wheel
    setuptools
)
makedepends=(
    "${_pymakedeps[@]/#/python-}"
)
optdepends=(
    "python-bflb-flash-command-uart: Bouffalolab Flash Command Tool"
    "python-bflb-fw-post-proc: Bouffalolab Firmware Post Proc"
    "python-bflb-iot-tool: BOUFFALOLAB IOT TOOL"
    "python-bflb-mcu-tool: BOUFFALOLAB MCU TOOL"
    "python-bflb-mcu-tool: Bouffalolab Mcu Tool uart"
)
options=('!strip')
optdepends=("jlink-software-and-documentation: Segger JLink software & documentation pack for Linux")
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('457305224cbafad8f916e1b0eb58c45577b066540ea2d11b56e8284d9e3f1738')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf bflb_iot_tool/utils/jlink
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
