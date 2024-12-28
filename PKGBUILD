# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-capture-stream
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.0.1.5
pkgrel=1
epoch=
pkgdesc="Capture video stream, save as screenshots."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-opencv
)
makedepends=(
    python-poetry
    python-build
    python-installer
    python-wheel
    python-setuptools)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('3d25b93c989e33bce12129e3452aa85ddc1d8d5c029854dabaef69dfa205a1ce')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
