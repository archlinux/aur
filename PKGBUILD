# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Pierre Chapuis <arch@catwell.info>

pkgname="johnnydep"
pkgver=2.1.0
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
sha256sums=('09a5d04c21af762a0abc498c50b291d37824c03bf54e89efab193dee4df1ee39')


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
