# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

appauthor='knoxell'
appname='ensurepath'
pkgname="python-${appname}"
pkgver=0.2.6
pkgrel=1
pkgdesc="Ensure python, pip and with pip installed binarys (scripts for win) are in your PATH variable"

_pypi_package=${appname}
_pypi_version=${pkgver}

url="https://github.com/${appauthor}/${appname}"
license=('Unlicense')
arch=('any')

depends=('python' 'python-userpath')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
sha256sums=('6c4405842a864b8721ff975546c493ce8fb42d49abf5aff88bcc273f2f9810e7')


build() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
