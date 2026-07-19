# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

appauthor=Gheat1
appname=ricekit
pkgname=python-${appname}
pkgver=0.2.0
pkgrel=1
pkgdesc="🍚 A developer's TUI suite for Textual — themes, widgets, modals, icons, and the design system behind ltui"

_pypi_package=${appname}
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${_pypi_package}/"
_url_github="https://github.com/${appauthor}/${appname}"
url=${_url_github}

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-hatchling')
depends=('python' 'python-textual' 'python-rich')

# source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b22a2a40e7cde10282fec16a79267c467bb63d92dd228b40f373ce615306eb6f')

build() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/" || exit

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/" || exit

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
