# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-toon
pkgver=0.1.3
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
sha256sums=('d3b08fb4db62484e87515faf1c7abf7a684074320fd56eef73e19f58a929bcf1')

build() {
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
