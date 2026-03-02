# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-jsparser
_name=${pkgname#python-}
pkgver=2.7.3
pkgrel=1
epoch=
pkgdesc="Fast javascript parser (based on esprima.js)"
arch=('any')
url="https://pypi.org/project/jsparser"
license=(MIT)
groups=()
provides=(${pkgname} python-pyjsparser)
conflicts=(${pkgname} python-pyjsparser)
_pydeps=()
depends=('python'
    "${_pydeps[@]/#/python-}")
makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools
)
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name}-$pkgver.tar.gz")
noextract=()
sha256sums=('4fcbbd6545d4c1fd48b58542bcf634a13fcd06c08eee91c3a68956a8c307c295')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
