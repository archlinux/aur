# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-p115pickcode
_name=${pkgname#python-}
pkgver=0.0.5.3
pkgrel=1
epoch=
pkgdesc="115 transcoding between pickcode and id."
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
    python-setuptools
)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('04992a38acdd9e157e6bc14b8db63c3af4bfe1dbdb6776c3d17c75eeba676af9')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE*
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
