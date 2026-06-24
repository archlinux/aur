# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="python-invocation-tree"
pkgdesc="Generate an invocation tree of functions calls"
pkgver=0.0.38
pkgrel=1

_pypi_package=${pkgname##python-}
_pypi_version=${pkgver}

arch=('any')
license=('BSD-2-Clause')
url='https://github.com/bterwijn/invocation_tree'

depends=('python' 'python-graphviz')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
sha256sums=('59d878b3adf3dc1dd913eb3c394c2eadabe47a65f5915fd61dbee9e8ea347c21')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
