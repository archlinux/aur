# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-p115updatedb
_name=${pkgname#python-}
pkgver=0.0.11
pkgrel=1
epoch=
pkgdesc="把 115 网盘的文件列表导出到数据库"
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${_name} ${pkgname})
conflicts=(${_name} ${pkgname})
depends=(
    python
    python-orjson
    #AUR
    python-concurrenttools
    python-p115client
    python-posixpatht
    python-sqlitetools
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
sha256sums=('2001bc16f0b7b5fd6084c1ff0abf1dc29a197f008796150dc6e1fbc14ae6b1be')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
