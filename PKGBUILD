# Maintainer: Tim Henkes <me+aur@syndace.dev>
# Contributor: Maxime “pep” Buquet <archlinux@bouah.net>

pkgname="python-slixmpp-omemo"
pkgver=2.2.0
pkgrel=1
pkgdesc="Slixmpp OMEMO plugin"
arch=("any")
url="https://github.com/Syndace/slixmpp-omemo"
license=("AGPL-3.0-only")
depends=(
    "python"
    "python-oldmemo"
    "python-omemo"
    "python-slixmpp"
    "python-twomemo"
    "python-xmlschema"
    "python-typing_extensions"
)
makedepends=(
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
checkdepends=("python-pytest" "python-pytest-asyncio")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Syndace/slixmpp-omemo/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("ddf1ee0fbccfe1e3a93bdf69791e91402c7e16e36ec299cd2a729a791dd5b221")

prepare() {
    mv "slixmpp-omemo-${pkgver}" "${pkgname}-${pkgver}"
}

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
}
