# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>


_upstreamver='1.3.0'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='spyder-terminal'


pkgname="${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="Spyder Plugin for displaying a virtual terminal (OS independent) inside the main Spyder window"
arch=('any')
url='https://docs.spyder-ide.org/current/plugins/terminal.html'
license=('MIT')
depends=('python' 'spyder' 'python-terminado' 'python-qstylizer' 'python-qtpy' 'python-tornado' 'python-requests' 'python-coloredlogs' 'python-pexpect' 'nodejs')
optdepends=()
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
sha256sums=('70de0f0c40ae66f6330f517f5ff770811459f11d048e1b9719801bc86fad20eb')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
