# Maintainer: Tim Henkes <me+aur@syndace.dev>
# Contributor: Maxime "pep" Buquet <archlinux@bouah.net>

pkgname="poezio-omemo"
pkgver=0.9.0
pkgrel=1
pkgdesc="OMEMO plugin for poezio"
arch=("any")
url="https://codeberg.org/poezio/poezio-omemo"
license=("GPL-3.0-only")
depends=(
    "poezio"
    "python"
    "python-oldmemo"
    "python-omemo"
    "python-slixmpp"
    "python-slixmpp-omemo"
)
makedepends=(
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/poezio/poezio-omemo/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("47bdcb8d6336ead9cfef6943741743a95ae6d91c2d9c1df64d66ef7d0adbe32c")

prepare() {
    mv "${pkgname}" "${pkgname}-${pkgver}"
}

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
