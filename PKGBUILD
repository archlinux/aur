# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-damiao-motor
_name=${pkgname#python-}
pkgver=1.0.5
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
sha256sums=('275ec1ca2471c6ee2eba703184b0b7c428df273d218bbd71bef31445631a76ac')

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
