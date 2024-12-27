# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-iter-collect
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.0.4
pkgrel=1
epoch=
pkgdesc="Python iter_collect."
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
    python-poetry-core
    python-build
    python-installer
    python-wheel
    python-setuptools)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('a9ecc9b19598cc1022d98df6246164eac0bc08ee5e5ec33b8311a15d89de10f2')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
