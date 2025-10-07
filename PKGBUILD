# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>


_upstreamver='0.4.1'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='spyder-line-profiler'


pkgname="${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="Plugin for the Spyder IDE that integrates the Python line profiler"
arch=('any')
url='https://docs.spyder-ide.org/current/plugins/lineprofiler.html'
license=('MIT')
depends=('python' 'spyder' 'python-qtawesome' 'python-qtpy' 'python-line-profiler')
optdepends=()
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
sha256sums=('c377bc9963c4474c4714bdacc4d002b43cd8311b4348c479b419d830cc816a82')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
