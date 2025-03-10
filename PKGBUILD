# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-jlc2kicadlib
_name=${pkgname#python-}
pkgver=1.0.36
pkgrel=1
epoch=
pkgdesc="JLC2KiCad_lib is a python script that generate a component library (symbol, footprint and 3D model) for KiCad from the JLCPCB/easyEDA library."
arch=('any')
url="https://pypi.org/project/JLC2KiCadLib"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
_pydeps=(
    requests
    kicadmodtree)
depends=('python'
    "${_pydeps[@]/#/python-}")
makedepends=(python-build
    python-installer
    python-wheel
    python-setuptools)
options=('!strip')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name}-$pkgver.tar.gz")
noextract=()
sha256sums=('a10e6d0a84e021fb6dffccacd816b4b276fae9b651d79e2119f5655c6a3f8e48')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
