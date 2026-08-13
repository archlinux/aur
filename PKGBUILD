# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="python-memory-graph"
pkgdesc="Generate intuitive graphs of your Python data"
pkgver=0.3.86
pkgrel=1

_pypi_package=${pkgname##python-}
_pypi_version=${pkgver}

arch=('any')
license=('BSD-2-Clause')
url='https://github.com/bterwijn/memory_graph'

depends=('python' 'python-graphviz' 'python-numpy' 'python-pandas')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
sha256sums=('c8e80770942e32bd16da1573d0b0090950f4aabfd5b14ac8ed9d02835f6e9bec')


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
