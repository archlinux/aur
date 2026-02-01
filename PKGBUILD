# Maintainer: Tim Henkes <me+aur@syndace.dev>

pkgname="python-twomemo-git"
pkgver=r55.ac9c5b3
pkgrel=1
pkgdesc="Backend implementation of the \`urn:xmpp:omemo:2\` namespace for python-omemo."
arch=("any")
url="https://github.com/Syndace/python-twomemo"
license=("MIT")
depends=(
    "python"
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
provides=("python-twomemo")
conflicts=("python-twomemo")
source=("${pkgname}::git+https://github.com/Syndace/python-twomemo.git")
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
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
