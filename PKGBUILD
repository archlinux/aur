# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-openlist
_name=${pkgname//-/_}
pkgver=0.0.1
pkgrel=1
epoch=
pkgdesc="Python wrapper for openlist."
arch=('any')
url="https://pypi.org/project/${pkgname}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-aiohttp
    python-dateutil
    python-httpx
    python-multidict
    python-orjson
    python-yarl
    #AUR
    python-aiofile
    python-dictattr
    python-download
    python-errno2
    python-filewrap
    python-glob-pattern
    python-httpfile
    python-http-request
    python-http-response
    python-httpx-request 
    python-iterutils
    python-property
    python-undefined
)
makedepends=(
    python-poetry
    python-build
    python-installer
    python-wheel
    python-setuptools
)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('a39ced4ded3721318d68d89ffa5aed924a0ad1fa4c1bfc15744c228113955f4f')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
