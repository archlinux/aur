# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-ldfparser
_name=${pkgname#python-}
pkgver=0.26.0
pkgrel=1
epoch=
pkgdesc="LIN Description File parser written in Python"
arch=('any')
url="https://github.com/c4deszes/ldfparser"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
_pydeps=(
    lark-parser
    jinja
# AUR
    bitstruct
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
source=("${_name}::git+${url}.git#tag=v${pkgver}")
noextract=()
sha256sums=('8be407dadcd92b0be3128b770dd133accea9d30d20b4f5c521db23ebc3d97d90')

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
