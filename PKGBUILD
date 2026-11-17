# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-pyiosbackup
pkgver=0.2.4
pkgrel=1
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
source=("${pkgname}::git+${url}.git")
noextract=()
sha256sums=('SKIP')
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
