# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-bflb-iot-tool
_name=${pkgname#python-}
pkgver=1.8.4
pkgrel=0
pkgdesc="BOUFFALOLAB IOT TOOL"
arch=('any')
url="https://pypi.org/project/bflb-iot-tool"
license=('MIT')
groups=()
depends=(python
        python-pyserial
        python-ecdsa
        python-pycryptodome
        python-pylink-square)
makedepends=(python-build
            python-installer
            python-wheel)
options=('!strip')
optdepends=("jlink-software-and-documentation: Segger JLink software & documentation pack for Linux")
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('1aed77b51b13f04313ee52114582635a521bff326e27d80239542aa52c000e98')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf bflb_iot_tool/utils/jlink
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
