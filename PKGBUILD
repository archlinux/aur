# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-p115oss
_name=${pkgname#python-}
pkgver=0.0.9.1
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
sha256sums=('c4492ed8b217fab7954bbd6d5c391c45e40a03bdcf16ed91e2dcbbe40ac7894e')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE*
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
