# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>


_upstreamver='5.0.0'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='line-profiler'


pkgname="python-${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="Line-by-line profiling for Python"
arch=('any')
url='https://github.com/pyutils/line_profiler'
license=('BSD-2-Clause')
depends=('glibc' 'gcc-libs' 'python' 'ipython' 'python-rich')
optdepends=()
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
sha256sums=('a80f0afb05ba0d275d9dddc5ff97eab637471167ff3e66dcc7d135755059398c')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
