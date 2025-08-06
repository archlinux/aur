# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-httpx-request
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.1.6
pkgrel=1
epoch=
pkgdesc="httpx request extension."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-httpx
    #AUR
    python-argtools
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
sha256sums=('47e6d82f69c1a9070017cbf07cdee4de8b640e4fb46e3432ecea2c17b2a54ab3')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
