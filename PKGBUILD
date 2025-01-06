# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-reverse-proxy
_name=${pkgname//-/_}
pkgver=0.0.10
pkgrel=1
epoch=
pkgdesc="Python reverse proxy."
arch=('any')
url="https://pypi.org/project/${pkgname}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-httpx
    python-websockets
    uvicorn
    #AUR
    python-blacksheep
    python-dictattr
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
sha256sums=('7a8434ebbd17df013415e3f6fc7b5dff88a08737a8c26e85a7a9dba04764abce')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
