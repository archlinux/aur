# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-can-candle
_name=${pkgname#python-}
pkgver=1.2.3
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
sha256sums=('9de93f1d1aef61561f637372ea26e0a17ada0781bdf36da89f5967e1a9f829e4')

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
