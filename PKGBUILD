# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-glob-pattern
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.0.2
pkgrel=4
epoch=
pkgdesc="Python shell glob pattern."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    #AUR
    python-posixpatht
)
makedepends=(
    python-poetry
    python-poetry-core
    python-build
    python-installer
    python-wheel
    python-setuptools)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('394db5fcbd8e45e726d821536a539cdadc53cfbbcc772d44d0a5837891b8ee18')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
