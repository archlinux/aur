# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-blacksheep-client-request
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.0.4
pkgrel=1
epoch=
pkgdesc="blacksheep request extension."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-brotli
    python-multidict
    python-zstandard

    #AUR
    python-argtools
    python-asynctools
    python-blacksheep
    python-cookietools
    python-filewrap
    python-http-response
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
sha256sums=('3ad9aed63829f8ec6e8660de5c99cbb256f9ee9eec1398280394579310688937')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
