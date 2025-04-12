# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-123-client
pkgver=0.0.5.1
pkgrel=1
epoch=
pkgdesc="Python wrapper for 123 webdisk."
arch=('any')
url="https://pypi.org/project/${_name}"
_name=${pkgname//-/_}
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-httpx
    python-multidict
    python-requests
    python-orjson
    python-yarl
    #AUR
    python-aiofile
    python-asynctools
    python-encode-uri
    python-filewrap
    python-hashtools
    python-httpfile
    python-http-request
    python-httpx-request
    python-iterutils
)
makedepends=(
    python-poetry
    python-build
    python-installer
    python-wheel
    python-setuptools)
optdepends=(
    'python-fastapi: FastAPI framework, high performance, easy to learn, fast to code, ready for production'
)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('5b9b7a9fea6187f2401e09af784ff961a1100174712787733c78fbef95a99311')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
