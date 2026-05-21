# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Pierre Chapuis <arch@catwell.info>

pkgname="ntfyme"
pkgver=0.0.2
pkgrel=1
pkgdesc="Simple terminal command line notification tool on completion of your commands and processes"

arch=("any")
license=("MIT")
url="https://github.com/AnirudhG07/ntfyme"

provides=("${pkgname}")

makedepends=(
    "python-setuptools"
    "python-wheel"
    "python-build"
    "python-installer"
    "python-hatchling"
)
depends=(
    "python-requests"
    "python-beaupy"
    "python-rich"
    "python-rich-click"
    "python-toml"
    "python-tomlkit"
    "python-cryptography"
    "python-plyer"
)

options=(!emptydirs)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "log.patch")
sha256sums=('51f66d478ebc4c4552bc41e8978ccb23e3e855e0b78213d13d26cba18124742a'
            '32e6c688e86e7ad6166041e78835b0127986d9662af06672f76329bd958d48e1')


prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}/" || exit

    patch -p1 < ../log.patch
}

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
