# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="ACoci86"
pkgname="terrahour"
pkgver=1.0.2
pkgrel=1
pkgdesc="World clock, world map and 24-hour meeting planner for the terminal"

_pypi_package=${pkgname}
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${pkgname}/"
_url_github="https://github.com/${pkgauthor}/${pkgname}"
url='https://moulti.run/'

provides=("${_pypi_package}")

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
depends=('python')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('33e46f5be01f41c807f9b81c9d0f565022620d39a84c588f737cf70a97ea9294')

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
