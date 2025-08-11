# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-requests-request
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.1.2.1
pkgrel=1
epoch=
pkgdesc="requests request extension."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-requests
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
sha256sums=('4397c665de62d9136faa497f88ce15825794651cc855e456fbf0b52107f7bb37')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
