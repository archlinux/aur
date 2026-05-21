# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Pierre Chapuis <arch@catwell.info>

pkgname="johnnydep"
pkgver=2.0.1
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

source=("$pkgname-src-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('88f487adcbe2571e56e9637993a1ae7da3e3db513a2cde499722485af9fe0411')


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
