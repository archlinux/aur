# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-id2dirnode
_name=${pkgname#python-}
pkgver=0.0.1
pkgrel=1
epoch=
pkgdesc="Implementation of id_to_dirnode."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    #AUR
)
makedepends=(
    python-poetry
    python-build
    python-installer
    python-wheel
    python-setuptools
)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('956c72156d1b27e6c46557189ce99465bcc580e09d3e5163df54e13908c586f4')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
