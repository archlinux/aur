# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-p123client
_name=${pkgname#python-}
pkgver=0.0.9.2
pkgrel=1
epoch=
pkgdesc="Python 123 webdisk client."
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
sha256sums=('2f251c66b722b6499e720eacef9fb3699cb6c2e92682a4ac7ef681401a5b62db')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
