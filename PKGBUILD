# Maintainer: Nagy Roland <roliboy@protonmail.com>

pkgname=python-pywhat
_pkgname=pyWhat
pkgver=3.4.1
pkgrel=1
pkgdesc="Identify emails, IP addresses and more"
arch=("any")
depends=(
    "python"
    "python-click"
    "python-rich"
)
makedepends=(
    "python-dephell"
    "python-setuptools"
)
optdepends=(
    "python-orjson: faster JSON serialization and deserialization"
)
url="https://github.com/bee-san/pyWhat"
license=("MIT")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=("f5182a20371e7bb3889bb5129c95e0e28ac7caf88eaf0e973fb32f30e54a8856")

prepare() {
    cd "${_pkgname}-${pkgver}"
    dephell deps convert --from pyproject.toml --to setup.py
}

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

