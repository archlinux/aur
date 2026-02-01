# Maintainer: Tim Henkes <me+aur@syndace.dev>

pkgname="python-oldmemo-git"
pkgver=r85.5640e04
pkgrel=1
pkgdesc="Backend implementation of the \`eu.siacs.conversations.axolotl\` namespace for python-omemo."
arch=("any")
url="https://github.com/Syndace/python-oldmemo"
license=("AGPL-3.0-only")
depends=(
    "python"
    "python-cryptography"
    "python-doubleratchet"
    "python-omemo"
    "python-protobuf"
    "python-typing_extensions"
    "python-x3dh"
    "python-xeddsa"
)
makedepends=(
    "git"
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
optdepends=("python-xmlschema: etree-based XML (de)serialization and validation")
provides=("python-oldmemo")
conflicts=("python-oldmemo")
source=("${pkgname}::git+https://github.com/Syndace/python-oldmemo.git")
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

package() {
    cd "${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
