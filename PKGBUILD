# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-toon
pkgver=0.2.0
pkgrel=1
epoch=
pkgdesc="TOON (Token-Oriented Object Notation) encoder/decoder for Python - Bidirectional JSON-to-TOON converter optimized for LLMs"
arch=('any')
url="https://github.com/xaviviro/python-toon"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
_pydeps=(
)
depends=('python'
    "${_pydeps[@]/#/python-}")
makedepends=(
    git
    python-build
    python-installer
    python-wheel
    python-setuptools
    python-hatchling
)
options=('!strip' '!debug')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
noextract=()
sha256sums=('9ba162fd06e81506cdd1cacf8f132d9f026c6655db9b1cc6b0694156da73af58')

build() {
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
