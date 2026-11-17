# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-typer-injector
pkgver=0.2.2
pkgrel=1
epoch=
pkgdesc="Dependency injection for typer"
arch=('any')
url="https://github.com/BenjyWiener/typer-injector"
license=('MIT')
groups=()
_pydeps=(
    typer
)
depends=(
    python
    "${_pydeps[@]/#/python-}"
)
makedepends=(
    'python-hatchling'
    'python-hatch-vcs'
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

# check() {
#     cd "${srcdir}/${pkgname}"
#     python -m pytest -v
# }

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm0644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
