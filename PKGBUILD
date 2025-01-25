# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-bflb-mcu-tool
_name=${pkgname#python-}
pkgver=1.9.0
pkgrel=7
epoch=
pkgdesc="BOUFFALOLAB MCU TOOL"
arch=('any')
url="https://pypi.org/project/bflb-mcu-tool"
license=(MIT)
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
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('297f252c2954d141024c9130a562054f4cb8a2a3bf67a7714c2e3ac6bfe07cc7')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf bflb_mcu_tool/utils/jlink
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
