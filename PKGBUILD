# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="cocode"
pkgver=0.10.1
pkgrel=1
pkgdesc="A powerful command-line tool for analyzing and processing code repositories"

arch=('any')
license=('MIT')
url='https://github.com/Pipelex/cocode'

_pypi_package=${pkgname}
_pypi_version=${pkgver}

provides=("${_pypi_package}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-hatchling')
depends=('pipelex' 'python' 'python-pydantic' 'python-rich' 'python-click' 'python-typing_extensions' 'python-pygithub' 'python-pathspec' 'python-typer' 'python-mthds')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('0dbffa41c2f88509a4bda15a238e7dcda67be7f0ea9abaf13ad49ea01bcc4bf9')

build() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
