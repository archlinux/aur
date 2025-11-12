# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-bflb-flash-command-uart
_name=${pkgname#python-}
pkgver=1.0.0
pkgrel=1
pkgdesc="BOUFFALOLAB IOT TOOL"
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
sha256sums=('ec49f0894a81b024917f038a395220824abc8c22120b5c49f0fbc2d7ea2eacf8')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
