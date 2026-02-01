# Maintainer: Tim Henkes <me+aur@syndace.dev>

pkgname="python-twomemo"
pkgver=2.1.0
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
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
optdepends=("python-xmlschema: etree-based XML (de)serialization and validation")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Syndace/python-twomemo/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("89c9d9ca8c1383e561271745f8229d8819d2cc6c708040ca5e7f459cef238b84")

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
