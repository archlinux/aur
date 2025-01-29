# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-123-client
pkgver=0.0.4.1
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
sha256sums=('8dd37de6c1dab244c3c5687ad41956fcfb919f8679b3b65168d1b0703ebb3995')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
