# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="thombashi"
pkgname="pathvalidate-cli"
pkgver=0.2.1
pkgrel=1
pkgdesc="The tool can sanitize/validate strings such as file-names/file-paths"

_pypi_package=${pkgname}
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${pkgname}/"
_url_github="https://github.com/${pkgauthor}/${pkgname}"
url=${_url_github}

provides=("${_pypi_package%-cli}")

makedepends=('python-setuptools' 'python-setuptools-scm' 'python-wheel' 'python-build' 'python-installer')
depends=('bash' 'python' 'python-pathvalidate' 'python-loguru' 'python-pytablewriter' 'python-msgfy' 'python-click')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9998f4379d29ff65de4808a8a0e6ef75d94a1e6e40659ff984fa50ba0eb90b80')

build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/" || exit

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/" || exit

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
