# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-damiao-motor
_name=${pkgname#python-}
pkgver=1.0.7b2
pkgrel=1
pkgdesc="Python driver for DaMiao (达妙) brushless motors over CAN with a unified CLI, web GUI, and library API"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/jia-xie/python-damiao-driver"
_pydeps=(
    can
    flask
    setuptools-scm
    waitress
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
sha256sums=('061ae671c0d5b03ea8d6dd4bb2307bd4e0d5b824130cbfd1f65dfce5459dc562')

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
    # install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
