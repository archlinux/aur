# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="python-line-profiler"
pkgver=5.1.0
pkgrel=1
pkgdesc="Line-by-line profiling for Python"

_pypi_package=${pkgname#python-}
_pypi_version=${pkgver}

arch=('any')
url='https://github.com/pyutils/line_profiler'
license=('BSD-2-Clause')
depends=('glibc' 'gcc-libs' 'python' 'ipython' 'python-rich')
optdepends=()
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
sha256sums=('5717a2dccf0ced65fd19ba5e479581c47412831fe768bc211c6d0f5ba1ad9b47')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
