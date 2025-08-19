# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-aiohttp-client-request
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.1.2
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
sha256sums=('c4aebfe52f01b19ce4ac24f16d48ed91513c59f20ff35d544bd6298fee9411fc')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
