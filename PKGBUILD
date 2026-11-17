# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-bytestruct
pkgver=0.1.2
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
sha256sums=('39955153a30ec1e706cde955d94827b96b9b4308891e90b5f5e92c661c6a18af')
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
