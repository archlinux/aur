# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="python-termgraph"
pkgver=0.8.0
pkgrel=1
pkgdesc="A Python command-line and library that draws basic graphs in the terminal"

_pypi_package=${pkgname#python-}
_pypi_version=${pkgver}

arch=('any')
license=('MIT')
url='https://github.com/mkaz/termgraph'

provides=(${_pypi_package})
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-hatchling')
depends=('python' 'python-colorama')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
sha256sums=('8e0cad7433d531fb041f7cbd1189261b784a55488726f02aa29ffe9d565d099b')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -vDm0644 -t "${pkgdir}/usr/share/doc/${pkgname}/data" data/*.{dat,py}

    install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
