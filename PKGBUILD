# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-p115oss
_name=${pkgname#python-}
pkgver=0.1.1
pkgrel=1
epoch=
pkgdesc="115 oss upload."
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
depends=(
    python
    python-orjson
    #AUR
    python-asynctools
    python-dicttools
    python-filewrap
    python-hashtools
    python-integer-tool
    python-iterutils
    python-httpcore-request
    python-httpfile
    python-http-client-request
    python-http-request
    python-http-response
    python-p115cipher
    python-p115pickcode
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
sha256sums=('2f10c9fa48ab335a947550c5d327d628387e0c3648c5e7bb793ac16613dae9fb')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE*
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
