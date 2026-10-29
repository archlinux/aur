# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-x690
_name=${pkgname#python-}
pkgver=2.0.0
pkgrel=1
epoch=
pkgdesc="Pure Python X.690 implementation"
arch=('any')
url="https://github.com/exhuma/x690"
license=(MIT)
groups=()
provides=(${pkgname})
conflicts=(${pkgname})
_pydeps=(
    importlib-metadata
    # AUR
    t61codec
)
depends=(
    python
    "${_pydeps[@]/#/python-}"
)
makedepends=(
    git
    python-hatchling
    python-build
    python-installer
    python-wheel
    python-setuptools
)
optdepends=()
options=('!strip' '!debug')
source=("${_name}::git+${url}.git#tag=v${pkgver}")
noextract=()
sha256sums=('33c345c707f001c769321d7d15faff79935fbf3adad043169d8a07063e4097c7')

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
    install -Dm0644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
