# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-numbers-parser
_name=${pkgname#python-}
pkgver=4.18.5
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
sha256sums=('6bd7258fb7ae0c8350d574f3994cccb2c012a0c8dec6fef05d492686b2361bbd')

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
