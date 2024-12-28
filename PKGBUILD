# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-path-ignore-pattern
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.0.1.1
pkgrel=2
epoch=
pkgdesc="Python path ignore pattern."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    #AUR
    python-glob-pattern
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
sha256sums=('5c028be09286bc210a35d250dcd433b068734d5462416879dab45c85ed07313a')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
