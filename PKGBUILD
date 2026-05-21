# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="pydeptree"
pkgver=0.3.21
pkgrel=1
pkgdesc="A Python dependency tree analyzer with rich terminal output, and code quality features"

arch=("any")
license=("MIT")
url="https://github.com/tfaucheux/pydeptree"

provides=("${pkgname}")

makedepends=(
    "python-setuptools"
    "python-wheel"
    "python-build"
    "python-installer"
    "python-hatchling"
)
depends=(
    "python-click"
    "python-rich"
)

options=(!emptydirs)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d32baca7cd94309f6819305f6fc698678e29b434500515dfe3463fa08e123df8')


build () {
    cd "${srcdir}/${pkgname}-${pkgver}/" || exit

    python -m build --wheel --no-isolation
}

package () {
    cd "${srcdir}/${pkgname}-${pkgver}/" || exit

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
