# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-bflb-flash-command-uart
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=1.4.3.post1
pkgrel=1
pkgdesc="Bouffalolab Flash Command Tool"
arch=('any')
url="https://pypi.org/project/${_name}"
license=('MIT')
groups=()
_pydeps=(
    configobj
    cryptography 
    pylink-square
    pyserial
)
depends=(
    python
    "${_pydeps[@]/#/python-}"
    #AUR   
    python-pycklink
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
sha256sums=('3797d2cf306dd10c996e3e1cba8651380ca6be21ce3f3a19a8014bf151b8c066')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
