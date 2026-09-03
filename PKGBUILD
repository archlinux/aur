# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-bflb-mcu-tool-uart
_name=${pkgname#python-}
pkgver=1.10.1
pkgrel=1
epoch=
pkgdesc="Bouffalolab Mcu Tool uart"
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname%-uart} ${_name})
conflicts=(${pkgname%-uart} ${_name})
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
    "python-bflb-mcu-tool: BOUFFALOLAB MCU TOOL"
	"python-bflb-iot-tool: BOUFFALOLAB IOT TOOL"
    "python-bflb-iot-tool-uart: Bouffalolab Mcu Tool uart"
)
options=('!strip')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('ecbc935688486d8fa61c6c1c85a26ff6ccd2fc461b719b9bbcae9537957665a4')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf bflb_mcu_tool/utils/jlink
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
