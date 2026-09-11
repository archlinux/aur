# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-jlc2kicadlib
_name=${pkgname#python-}
pkgver=1.3.2
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
sha256sums=('63fed518a788a23e3e8257246ec2ef9c66e5182acdf85266d5f492935b851a3c')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
