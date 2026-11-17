# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-ansilogs
pkgver=1.2.0
pkgrel=3
epoch=
pkgdesc="Colored, single-line log output for command-line tools: a dependency-free coloredlogs.install() replacement"
arch=('any')
url="https://github.com/doronz88/ansilogs"
license=('MIT')
groups=()
_pydeps=(
)
depends=(
    python
    "${_pydeps[@]/#/python-}"
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-setuptools-scm'
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
options=(!debug)
# install=
changelog=
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
noextract=()
sha256sums=('234b24c8c5352b49760be0bb86148f1f182209f6907873a2aa42a1b671e26733')
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
    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
