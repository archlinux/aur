# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-p123client
_name=${pkgname#python-}
pkgver=0.0.9.1
pkgrel=1
epoch=
pkgdesc="Python wrapper for 123 webdisk."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-httpx
    python-multidict
    # python-requests
    python-qrcode
    python-orjson
    python-undefined
    python-yarl
    # AUR
    python-aiofile
    python-asynctools
    python-encode-uri
    python-dicttools
    python-filewrap
    python-hashtools
    python-httpfile
    python-http-request
    python-httpx-request
    python-iterutils
    python-property
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
sha256sums=('e0f43cd55ec88e57e6234802b4f50054312f0c699d636fbce2a9721dd28991a6')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
