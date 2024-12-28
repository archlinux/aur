# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-sqlite-logger
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.0.1
pkgrel=1
epoch=
pkgdesc="Write logs to SQLite db file."
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
sha256sums=('791c4fe490185478cf09fcc107a248fcb453b08b38fe5f1e0fab56373c2ac0f9')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
