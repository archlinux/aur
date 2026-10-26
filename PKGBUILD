# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=python-weasel
_pkg="${pkgname#python-}"
pkgver=1.0.1
pkgrel=1
pkgdesc="A small and easy workflow system"
url="https://github.com/explosion/weasel/"
depends=(
    "python-confection"
    "python-wasabi"
    "python-srsly"
    "python-typer"
    "python-cloudpathlib"
    "python-smart_open"
    "python-httpx"
    "python-pydantic"
)
makedepends=(
	"python-build"
	"python-installer"
	"python-setuptools"
	"python-wheel"
)
license=("MIT")
arch=(any)
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::${url}/releases/download/release-v${pkgver}/${_pkg}-${pkgver}.tar.gz")
sha256sums=("ca5dbfd24002dd85bd8a73a7f02d2471744c1b1a64d25698e05bb587a099a43e")

build() {
    cd ${_pkg}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${_pkg}-${pkgver}
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
