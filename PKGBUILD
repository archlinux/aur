# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-urllib3-request
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.1.4.1
pkgrel=1
epoch=
pkgdesc="urllib3 request extension."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-urllib3
    #AUR
    python-argtools
    python-cookietools
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
sha256sums=('a9860f9da7f8152d287371d9ac3d6a0ce6a6ea3138e2d63876993d56d37708ae')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
