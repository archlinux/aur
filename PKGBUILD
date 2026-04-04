# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-can-candle
_name=${pkgname#python-}
pkgver=1.2.4
pkgrel=1
pkgdesc="Full featured CAN driver for Geschwister Schneider USB/CAN devices"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/BIRLab/python-can-candle"
_pydeps=(
    can
    # AUR
    candle-api
)
depends=('python'
    "${_pydeps[@]/#/python-}")
makedepends=(
    git
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('5748726bf4c282b5e6a39ccdaff3bdd155494d1319127fdc202d41cfaef29ac3')

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
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
