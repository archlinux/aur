# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-p115qrcode
_name=${pkgname#python-}
pkgver=0.0.3
pkgrel=1
epoch=
pkgdesc="115 网盘二维码扫码登录."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${_name} ${pkgname})
conflicts=(${_name} ${pkgname})
depends=(
    python
    python-flask
    python-httpx
    python-qrcode
    python-requests
    python-orjson
    #AUR
    python-httpx-request
    python-startfile
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
sha256sums=('b527bf3e2b5853fd72037a9d45ce13a3aa34f982bde90c986d74955d3dc36ce8')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
