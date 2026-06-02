# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-p115oss
_name=${pkgname#python-}
pkgver=0.1.0.1
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
sha256sums=('cec1ec7a699a7779a4b13d451d8556c54b22f3f43b4791ad39a88d7f1b0d076c')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE*
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
