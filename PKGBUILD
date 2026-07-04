# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributer: Carl Smedstad <carsme@archlinux.org>

pkgauthor="Textualize"
pkgname="toolong"
execname="tl"
pkgver=1.5.0
pkgrel=1
pkgdesc="A terminal log file viewer / tailer / analyzer"

_pypi_package=${pkgname}
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${_pypi_package}/"
_url_github="https://github.com/${pkgauthor}/${pkgname}"
url="${_url_github}"

provides=("${execname}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-hatchling')
depends=('python' 'python-typing_extensions' 'python-textual' 'python-click' 'python-rich')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('49934701f954f9701d37381bed6e0f3dfbea0abe1065fcf1ff35de9eef3bbcf3')

build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/" || exit

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/" || exit

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
