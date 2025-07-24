# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-alist
_name=${pkgname//-/_}
pkgver=0.0.14
pkgrel=1
epoch=
pkgdesc="Python wrapper for alist."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-dateutil
    python-httpx
    python-multidict
    python-orjson
    python-yarl
    #AUR
    python-argtools
    python-asynctools
    python-ed2k
    python-dictattr
    python-download
    python-filewrap
    python-glob-pattern
    python-httpfile
    python-http-request
    python-http-response
    python-iterutils
    python-path-ignore-pattern
    python-p115qrcode
    python-undefined
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
sha256sums=('a0db7273b47d13cbaad1e7e6675c3de51cd7c507fb0fabbb672ab72c8cbc8fcd')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
