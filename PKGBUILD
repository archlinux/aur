# Maintainer: Tim Henkes <me+aur@syndace.dev>
# Contributor: Sam Whited <sam@samwhited.com>
# Contributor: Maxime "pep" Buquet <archlinux@bouah.net>

pkgname="python-doubleratchet"
pkgver=1.3.0
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
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
checkdepends=("python-pytest" "python-pytest-asyncio")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Syndace/python-doubleratchet/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("1368d7bbd71f4b94999d72301be3637ff244105cb015cc090423afe0fdaad0d0")

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${pkgname}-${pkgver}"
    pytest -o addopts=""
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
