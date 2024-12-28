# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-torrent-tool
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.0.4.3
pkgrel=1
epoch=
pkgdesc="torrent tool."
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
sha256sums=('8d15c3495ff03cee6783bab38685088eae17b8a5c98527fb40aef38dca2852f1')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
