# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-toon
pkgver=0.1.2
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
    # AUR
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
sha256sums=('f147dc44344ac57480ec3e8eede74fd5e5b664c4bdaaa461a10b319e3221e22d')

build() {
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
