# Maintainer: Tim Henkes <me+aur@syndace.dev>
# Contributor: Sam Whited <sam@samwhited.com>
# Contributor: Maxime "pep" Buquet <archlinux@bouah.net>

pkgname="python-x3dh"
pkgver=1.3.0
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
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
checkdepends=("python-pytest" "python-pytest-asyncio")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Syndace/python-x3dh/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("0a7b3b589fe747a20649d2b3112256cb76ce600ea5c715ea459c6c5b3b67cdcf")

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
