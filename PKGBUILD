# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-kicadmodtree
_name=KicadModTree
pkgver=1.1.2
pkgrel=0
epoch=
pkgdesc="This repository contains scripts to generate custom KiCAD footprints using python, and a framework which allows us to create custom KiCAD footprint. A big bunch of footprints of the KiCad library was developed using this framework."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(GPL-3.0-or-later)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
_pydeps=(
    yaml)
depends=('python'
    "${_pydeps[@]/#/python-}")
makedepends=(python-build
            python-installer
            python-wheel
            python-setuptools)
options=('!strip')
source=("${_name//-/_}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
noextract=()
sha256sums=('5dd9d8f45b5e2646b0d5412111b5ed12308fb9b8ad4b32640a3ab6545fb0eca2')

build() {
    cd "${srcdir}/${_name//-/_}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name//-/_}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
