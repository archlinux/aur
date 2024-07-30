# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-kicad-package-manager
_name=${pkgname#python-}
pkgver=0.0.23
pkgrel=2
epoch=
pkgdesc="This is a package manager for KiCad symbols, footprints, 3d models, simulation files, and hierarchical sheets."
arch=('any')
url="https://pypi.org/project/kicad-package-manager"
license=(MIT)
groups=()
provides=(${_name})
conflicts=(${_name})
_pydeps=(
    requests
    sexpdata)
depends=('python'
    "${_pydeps[@]/#/python-}")
makedepends=(python-build
            python-installer
            python-wheel
            python-setuptools)
options=('!strip')
source=("${_name//-/_}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz")
noextract=()
sha256sums=('92d1f21decfda64594b9a2d3967bd38d77565ca084fca9c3c95621ac10809629')

build() {
    cd "${srcdir}/${_name//-/_}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name//-/_}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
