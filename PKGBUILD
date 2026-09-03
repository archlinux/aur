# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-bflb-mcu-tool-uart
_name=${pkgname#python-}
pkgver=1.10.0
pkgrel=1
epoch=
pkgdesc="Bouffalolab Mcu Tool uart"
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
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
)
options=('!strip')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('d98dce1d9900c3410bd65aa7dde8ef78511bc8807041de3237e4d7abf008c07c')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf bflb_mcu_tool/utils/jlink
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
