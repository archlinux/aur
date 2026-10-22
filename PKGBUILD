# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-canmatrix
_name=${pkgname#python-}
pkgver=1.3.3.1
pkgrel=1
epoch=
pkgdesc="Canmatrix is a python package to read and write several CAN (Controller Area Network) database formats"
arch=('any')
url="https://github.com/ebroecker/canmatrix"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
_pydeps=(
    attrs
    click
    lxml
    importlib-metadata
    openpyxl
    xlrd
    xlwt
    yaml
# AUR
    canopen
    ldfparser
)
depends=('python'
    "${_pydeps[@]/#/python-}")
makedepends=(
    git
    python-build
    python-installer
    python-wheel
    python-setuptools
)
options=('!strip' '!debug')
source=("${_name}::git+${url}.git#tag=${pkgver}")
noextract=()
sha256sums=('ad575a5bc9a20f4bb5d48c56c7168746732f96cf1cae5bb78f3d9fe030863121')

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
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
