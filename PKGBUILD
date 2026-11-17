# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-bytestruct
pkgver=0.2.0
pkgrel=1
epoch=
pkgdesc="Declarative binary records and composable codecs, using only the standard library"
arch=('any')
url="https://github.com/doronz88/bytestruct"
license=('MIT')
groups=()
_pydeps=(
    typing_extensions
)
depends=(
    python
    "${_pydeps[@]/#/python-}"
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-flit-scm'
    'python-wheel'
    'git'
)
checkdepends=(
    python-pytest
)
optdepends=()
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
backup=()
options=()
# install=
changelog=
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
noextract=()
sha256sums=('f4375f58010b5972a0836356a0c09547ac544580e1bd2dc0a14872897bea9201')
#validpgpkeys=()

prepare(){
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${pkgname}"
    python -m pytest -v
}

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm0644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
