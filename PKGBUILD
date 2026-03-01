# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-jlc2kicadlib
_name=${pkgname#python-}
pkgver=1.2.3
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
makedepends=(
    python-hatchling
    python-build
    python-installer
    python-wheel
    python-setuptools
)
options=('!strip')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name}-$pkgver.tar.gz")
noextract=()
sha256sums=('eb47928aec4d975677e6574f5b6a364049a230438ba83fb5345663eb628b24cc')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
