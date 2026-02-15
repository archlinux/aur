# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-blacksheep-client-request
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=0.1.3
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
sha256sums=('72473932c96f8a52699a215865d836dff3413a398253d842a7ca409df6ed40e9')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    rm -rf LICENSE
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
