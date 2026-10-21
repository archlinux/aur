# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Pierre Chapuis <arch@catwell.info>

pkgname="johnnydep"
pkgver=2.1.1
pkgrel=1
pkgdesc="Display dependency tree of Python distribution"

arch=("any")
license=("MIT")
url="https://github.com/wimglenn/johnnydep"

provides=("${pkgname}")

makedepends=(
    "python-setuptools"
    "python-wheel"
    "python-build"
    "python-installer"
    "python-hatchling"
)
depends=(
    "python-unearth"
    "python-anytree"
    "python-structlog"
    "python-tabulate"
    "python-rich"
    "python-wimpy"
    "python-cachetools"
    "python-oyaml"
    "python-toml"
    "python-tomli-w"
    "python-pip"
    "python-packaging"
    "python-wheel"
    "python-loguru"
)

options=(!emptydirs)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/w${pkgver}.tar.gz")
sha256sums=('ac6f1d63d805c928f922d0f7c6f9fea76d276347fe9e27920709cdea54704d70')


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
