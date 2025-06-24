# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-integer-tool
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.0.3
pkgrel=1
epoch=
pkgdesc="Python functions for integer."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
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
sha256sums=('5b93f33aaba65260a6381497cb9f0058ba21afa473c39bb54d0ac20678a0e15c')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
