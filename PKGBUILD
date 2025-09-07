# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>


_upstreamver='2.1.3'
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
_blake2b_256="fb59de22ad1e6d2a851c042e9ba0beff1cdd1c13236a8887b27f835d4b6941cf"
source=("https://files.pythonhosted.org/packages/${_blake2b_256:0:2}/${_blake2b_256:2:2}/${_blake2b_256:4}/${_pypi_package//-/_}-${_upstreamver}.tar.gz")
sha256sums=('89ec4d321254fb88b7ff06fc85d0c030961b2523fc7f46cfa0007ec3a0638cf5')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
