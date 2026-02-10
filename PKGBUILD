# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-numbers-parser
_name=${pkgname#python-}
pkgver=4.18.2
pkgrel=1
pkgdesc="Read and write Apple Numbers spreadsheets"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/masaccio/numbers-parser"
_pydeps=(
    compact-json
    enum-tools
    sigfig

    dateutil
    importlib-resources
    protobuf
    snappy
)
depends=('python'
    "${_pydeps[@]/#/python-}")
makedepends=(
    git
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel')
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('008d736a9a7046d2dd4ab16d553479ee415b2700d81287032b42ff71323c0078')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
