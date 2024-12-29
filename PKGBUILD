# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-reverse-proxy
_name=${pkgname//-/_}
pkgver=0.0.9.2
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
sha256sums=('e7a104dabadc57bef17148a125d566e02144bfd4a7523a6d567511b10412bf6f')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
