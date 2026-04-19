# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-ldfparser
_name=${pkgname#python-}
pkgver=0.25.0
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
sha256sums=('209b56544783750a40791b31ac2b0359d7d0f8fc0a5b41ee65d45b9f69bf0712')

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
