# Maintainer: Tim Henkes <me+aur@syndace.dev>
# Contributor: Maxime "pep" Buquet <archlinux@bouah.net>

pkgname="python-doubleratchet-git"
pkgver=r88.30473a1
pkgrel=1
pkgdesc="A Python implementation of the Double Ratchet algorithm."
arch=("any")
url="https://github.com/Syndace/python-doubleratchet"
license=("MIT")
depends=(
    "python"
    "python-cryptography"
    "python-pydantic"
    "python-typing_extensions"
)
makedepends=(
    "git"
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
checkdepends=("python-pytest" "python-pytest-asyncio")
provides=("python-doubleratchet")
conflicts=("python-doubleratchet")
source=("${pkgname}::git+https://github.com/Syndace/python-doubleratchet.git")
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

check() {
    cd "${pkgname}"
    pytest -o addopts=""
}

package() {
    cd "${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
