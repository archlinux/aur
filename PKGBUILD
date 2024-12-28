# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-path-predicate
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.0.1.1
pkgrel=2
epoch=
pkgdesc="Python path predication."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    #AUR
    python-path-ignore-pattern
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
sha256sums=('3c817fb8abe53c3a95c28b5187cd482c8bf7bb9c0654d77e7d7209f98ef7c590')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
