# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-renamer
_name=${pkgname//-/_}
pkgver=0.0.1
pkgrel=1
epoch=
pkgdesc="Python batch renamer."
arch=('any')
url="https://pypi.org/project/${pkgname}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    #AUR
    python-filerev
    python-iterdir
    python-json-write
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
sha256sums=('a9d6ae5d65fd1948b88578712e4c4be572ecfb466adef301c37d5c3822817aab')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
