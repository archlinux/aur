# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-damiao-motor
_name=${pkgname#python-}
pkgver=1.0.7b1
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
sha256sums=('dfb8a634ec0d82d87566f20fb0a55e0c4626bf8018534e8a0f24d20c73d687f7')

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
