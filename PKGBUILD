# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-pyiosbackup
pkgver=0.2.4
pkgrel=3
epoch=
pkgdesc="A python parser for iOS backups"
arch=('any')
url="https://github.com/matan1008/pyiosbackup"
license=('GPL-3.0-or-later')
groups=()
_pydeps=(
    bpylist2 # AUR
    cryptography
    packaging
    construct
    click
)
depends=(
    python
    "${_pydeps[@]/#/python-}"
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
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
sha256sums=('9617253e4de78221a0813154f02070114ee5de4020be9ab7299c802f9d77f6c1')
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
