# Maintainer: Nagy Roland <roliboy@protonmail.com>

pkgname=python-pywhat
_pkgname=pyWhat
pkgver=3.3.0
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
url="https://github.com/bee-san/pyWhat"
license=("GPL-3.0")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=("a81891c712f197e0f1446c0b52288b3ebdfafd125e3b8621cfd311d2468c4577")

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

