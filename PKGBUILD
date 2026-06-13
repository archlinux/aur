# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-id2dirnode
_name=${pkgname#python-}
pkgver=0.0.2
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
sha256sums=('42ce0cc57976ce06654e9f87c72f76ba5679afdb85889de95e36762e93e11f14')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
