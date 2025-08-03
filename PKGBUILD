# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>


_upstreamver='2.1.1'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='periodic-table-cli'


pkgname="${_pypi_package}-py"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="An interactive Periodic Table of Elements app for the console (Python)"
arch=('x86_64')
url='https://github.com/spirometaxas/periodic-table-cli-py'
license=('MIT')
depends=('python')
optdepends=()
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
conflicts=("${_pypi_package}-js")
provides=("${_pypi_package}")
_blake2b_256="dada9a2e8af1c993b06923e0bad3951ee5a8eabf61f90d56e35ce343043ea969"
source=("https://files.pythonhosted.org/packages/${_blake2b_256:0:2}/${_blake2b_256:2:2}/${_blake2b_256:4}/${_pypi_package}-${_upstreamver}.tar.gz")
sha256sums=('e7e44e97ac30e92760bebd586a2893b823270396524358ffb1d68de2f8713d40')


build() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
