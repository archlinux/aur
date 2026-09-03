# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-bflb-fw-post-proc
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=1.4.5
pkgrel=2
pkgdesc="Bouffalolab Firmware Post Proc"
arch=('any')
url="https://pypi.org/project/${_name}"
license=('MIT')
groups=()
_pydeps=(
    colorama
    cryptography
    tomli
)
depends=(
    python
    "${_pydeps[@]/#/python-}"
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
options=('!strip')
optdepends=(
    "python-bflb-flash-command-uart: Bouffalolab Flash Command Tool"
    "python-bflb-mcu-tool: BOUFFALOLAB MCU TOOL"
	"python-bflb-mcu-tool-uart: Bouffalolab Iot Tool uart"
	"python-bflb-iot-tool: BOUFFALOLAB IOT TOOL"
    "python-bflb-iot-tool-uart: Bouffalolab Mcu Tool uart"
)
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('427091fff44112589a06b6268a41a4ec80e06ea8e9e3628c902165f3ae588ebe')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
