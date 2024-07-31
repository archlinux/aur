# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-jlc2kicadlib
_name=JLC2KiCadLib
pkgver=1.0.31
pkgrel=0
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
source=("${_name//-/_}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
noextract=()
sha256sums=('dc9abc4849e8d17272652d2b41b2413e1cee23f6d58276929f3af5c8753bd8fd')

build() {
    cd "${srcdir}/${_name//-/_}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name//-/_}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
