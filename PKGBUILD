# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-p115qrcode
_name=${pkgname#python-}
pkgver=0.0.5.1
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
sha256sums=('51de59cc9966f2cd5a3b0b885e0e9e0f239569995f891174578cddb4aa759e6e')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
