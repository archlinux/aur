# Maintainer: Andrey Anshin <Andrey.Anshin@taragol.is>

pkgname=python-pidfile
pkgver=3.1.1
pkgrel=2
pkgdesc="Python context manager for managing pid files"
arch=("any")
url="https://pypi.python.org/pypi/python-pidfile"
license=('MIT')
makedepends=(
    "python-build"
    "python-wheel"
    "python-installer"
    "python-setuptools"
)
depends=(
    "python"
    "python-psutil"
)

source=("${pkgname}-${pkgver}.tar.gz::https://pypi.io/packages/source/p/python-pidfile/${pkgname}-${pkgver}.tar.gz")
sha512sums=("314a2e670d2a6baae786b8aa7639a1384bd177b8006b221e46caf297140d840b72ff23629aac22648b41072274dd44cbfc454444ffcfe64c7cf6fd24fae15c1d")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -B -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -B -m installer --destdir="${pkgdir}" dist/*.whl
    install -D -m755 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
