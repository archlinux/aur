# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-p115updatedb
_name=${pkgname#python-}
pkgver=0.0.12.1
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
sha256sums=('ba21add3d1bbeb0b66e9f4fee6acaa3f12f57101a859fe62cd95e0658916e8db')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
