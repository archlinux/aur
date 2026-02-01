# Maintainer: Tim Henkes <me+aur@syndace.dev>
# Contributor: Maxime "pep" Buquet <archlinux@bouah.net>

pkgname="python-x3dh-git"
pkgver=r101.b39a6d3
pkgrel=1
pkgdesc="A Python implementation of the Extended Triple Diffie-Hellman key agreement protocol."
arch=("any")
url="https://github.com/Syndace/python-x3dh"
license=("MIT")
depends=(
    "python"
    "python-cryptography"
    "python-pydantic"
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
checkdepends=("python-pytest" "python-pytest-asyncio")
provides=("python-x3dh")
conflicts=("python-x3dh")
source=("${pkgname}::git+https://github.com/Syndace/python-x3dh.git")
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
