# Maintainer: Tim Henkes <me+aur@syndace.dev>
# Contributor: Maxime "pep" Buquet <archlinux@bouah.net>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Riccardo Berto <riccardobrt@gmail.com>

pkgname="python-omemo"
pkgver=2.1.0
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Syndace/python-omemo/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("49fb4597996dc0b4cc4fa2696a77b9e3c5af601e2f83462e811d0683d182635d")

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

#check() {
#    cd "${pkgname}-${pkgver}"
#    pytest -o addopts=""
#}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
