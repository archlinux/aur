# Maintainer: Tristan Hill
# Contributor: Yigit Sever <yigit at yigitsever dot com>

pkgname=python-extruct
_pkgname=extruct
pkgver=0.18.0
pkgrel=1
pkgdesc="Extract embedded metadata from HTML markup"
arch=("any")
url="https://github.com/scrapinghub/extruct"
license=("BSD-3-Clause")

depends=(
    "python-html-text"
    "python-jstyleson"
    "python-lxml"
    "python-mf2py"
    "python-pyrdfa3"
    "python-rdflib"
    "python-requests"
    "python-six"
    "python-w3lib"
)

makedepends=(
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=("0a9b8703159e89fa0d7b87d7c40c12ba609f61c31a42aa87e9027e774a78a3cb")

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
