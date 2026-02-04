# Maintainer: taotieren <admin@taotieren.com>

pkgname=easyeda2kicad
_name=${pkgname}
pkgver=0.6.5
pkgrel=3
pkgdesc="Convert any LCSC components (including EasyEDA) to KiCad library"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/uPesy/easyeda2kicad.py"
_pydeps=(
    requests
    pydantic)
depends=('python'
    "${_pydeps[@]/#/python-}")
makedepends=(
    git
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel')
license=('AGPL-3.0-or-later')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('1fb8f593db668ebfe6c819a36a16c7505817b1d5b716a3a7017bf53694db626d')

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
}
