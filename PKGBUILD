# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="python-memory-graph"
pkgdesc="Generate intuitive graphs of your Python data"
pkgver=0.3.88
pkgrel=1

_pypi_package=${pkgname##python-}
_pypi_version=${pkgver}

arch=('any')
license=('BSD-2-Clause')
url='https://github.com/bterwijn/memory_graph'

depends=('python' 'python-graphviz' 'python-numpy' 'python-pandas')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
sha256sums=('624e2454090e29a3a5911385b82cacb4e43b63a2d830adef3e248ed6bc8edaa2')


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
