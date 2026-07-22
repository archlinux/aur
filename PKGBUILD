# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-bflb-flash-command-uart
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=1.4.3
pkgrel=1
pkgdesc="Bouffalolab Flash Command Tool"
arch=('any')
url="https://pypi.org/project/${_name}"
license=('MIT')
groups=()
_pydeps=(
    toml
    configobj
    cryptography 
    pylink-square
    pyserial
)
depends=(
    # gcc-libs
    # glibc
    # libusb
    # pyside6
    python
    "${_pydeps[@]/#/python-}"
    #AUR   
    python-pycklink
    # python-portalocker
    python-telnetlib-313-and-up
)
_pymakedeps=(
    build
    installer
    wheel
    setuptools)
makedepends=(
    "${_pymakedeps[@]/#/python-}")
options=('!strip')
optdepends=("python-bflb-mcu-tool: BOUFFALOLAB MCU TOOL"
	"python-bflb-iot-tool: BOUFFALOLAB IOT TOOL")
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('e18414f076f72b1d26cb0fb4efa60d1efbf3953bae9a70a7eab4541c915e1ed3')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
