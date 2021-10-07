# Maintainer: Nagy Roland <roliboy@protonmail.com>

pkgname=python-pywhat
_pkgname=pyWhat
pkgver=4.1.0
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
sha256sums=("76a4bfd7bb55671dea91c8af414ff55b657e1178e83011007d4e5d68fbeae429")

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

