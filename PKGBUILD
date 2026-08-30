# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="kangtegong"
pkgname="python-pyuring"
pkgver=0.3.3
pkgrel=1
pkgdesc="Python bindings and high-level abstractions for Linux io_uring-based asynchronous I/O"

_pypi_package=${pkgname#python-}
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${pkgname}/"
_url_github="https://github.com/${pkgauthor}/${pkgname}"
url="${_url_github}"

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
depends=('python' 'glibc' 'liburing')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/v${pkgver}.tar.gz")
sha256sums=('089f0ec7d27ea5c4f9f6f21cc915ed29e147d168399918334d2a3b5771cadb8f')

build() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/" || exit

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/" || exit

    python -m installer --destdir="${pkgdir}" dist/*.whl

    rm -rf "${pkgdir}/usr/lib/python3.14/site-packages/tests/"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
