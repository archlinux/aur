# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-numbers-parser
_name=${pkgname#python-}
pkgver=3.0.0
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
sha256sums=('93261eeae1a3a8af0a0f79a08584554a1235ada9852ad510a22a854526256323')

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
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
