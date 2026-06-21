# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-urllib3-request
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.1.6
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
    python-yarl
    #AUR
    python-argtools
    python-cookietools
    python-dicttools
    python-filewrap
    python-http-response
    python-http-request
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
sha256sums=('5d2f17117cd5548f2afccfe1475e2475b575665560b93dbb938b3f15f383e952')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
