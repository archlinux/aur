# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-alist-proxy
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.1.1
pkgrel=1
epoch=
pkgdesc="Python alist proxy and monitor."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-aiosqlite
    python-dateutil
    python-httpx
    python-motor
    python-orjson
    python-redis
    python-yarl
    uvicorn
    #AUR
    python-alist
    python-blacksheep
    python-cookietools
    python-reverse-proxy
    python-p115qrcode
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
sha256sums=('ae7a4c020402f9d47badd9c49fd295ed8989359b137227eb402617007e4c778e')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
