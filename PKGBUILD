# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>


_upstreamver='5.0.1'
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
sha256sums=('3e56c5eee51aa8b82a09d8a35ab19f4100ee45d70eb676c2c58deedcc06c34b1')


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
