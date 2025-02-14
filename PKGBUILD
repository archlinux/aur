# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-sqlitetools
_name=${pkgname#python-}
pkgver=0.0.3.1
pkgrel=1
epoch=
pkgdesc="Python sqlite3 tools."
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
sha256sums=('18186be06d82e89e580964a59d862c7d63c471c8df5f1128d8ef34ad68f94f76')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
