# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-p189client
_name=${pkgname#python-}
pkgver=0.0.2.3
pkgrel=1
epoch=
pkgdesc="Python 189 webdisk client."
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
    python-orjson
    python-yarl
    # AUR
    python-aiofile
    python-asynctools
    python-cookietools
    python-encode-uri
    python-errno2
    python-dicttools
    python-filewrap
    python-hashtools
    python-httpfile
    python-http-request
    python-httpx-request
    python-iterutils
    python-p189sign
    python-property
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
sha256sums=('9519341532c7b573629cc7ac5104734514082d61275f423dc0ec439ec89d3c21')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
