# Maintainer: Tim Henkes <me+aur@syndace.dev>

pkgname="python-omemo-git"
pkgver=r243.ea8c408
pkgrel=2
pkgdesc="An open python implementation of the OMEMO Multi-End Message and Object Encryption protocol."
arch=("any")
url="https://github.com/Syndace/python-omemo"
license=("MIT")
depends=(
    "python"
    "python-typing_extensions"
    "python-xeddsa"
)
makedepends=(
    "git"
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
#checkdepends=(
#    "python-oldmemo"
#    "python-twomemo"
#    "python-twisted"
#    "python-pytest"
#    "python-pytest-asyncio"
#    "python-xmlschema"
#)
optdepends=(
    "python-prettytable: for the optional cli"
    "python-twisted: alternative async backend"
)
provides=("python-omemo")
conflicts=("python-omemo")
source=("${pkgname}::git+https://github.com/Syndace/python-omemo.git")
sha256sums=("SKIP")

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname}"
    git clean -dfx
}

build() {
    cd "${pkgname}"
    python -m build --wheel --no-isolation
}

#check() {
#    cd "${pkgname}"
#    pytest -o addopts=""
#}

package() {
    cd "${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
