# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>


_upstreamver='2.1.2'
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
_blake2b_256="f2b3de99f3bd627440d8fddfc3765ec3ca4fca816d6f237e0f0fefe95c065e8f"
source=("https://files.pythonhosted.org/packages/${_blake2b_256:0:2}/${_blake2b_256:2:2}/${_blake2b_256:4}/${_pypi_package//-/_}-${_upstreamver}.tar.gz")
sha256sums=('1678af018f5131ec466cd6ecd05cf3330572cba65c9ea481e33c4303204ddef3')


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
