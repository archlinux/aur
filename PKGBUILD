# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-aiohttp-client-request
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.0.4
pkgrel=1
epoch=
pkgdesc="aiohttp request extension."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-aiohttp
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
sha256sums=('1d192bf619e6b0521da7c2a482b580ff2efc677c778f4c208ddeb244cb4ca3f9')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
