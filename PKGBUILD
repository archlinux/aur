# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>


_upstreamver='0.6.2'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='spyder-notebook'


pkgname="${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="Jupyter notebook integration with Spyder"
arch=('any')
url='https://docs.spyder-ide.org/current/plugins/notebook.html'
license=('MIT')
depends=('spyder' 'jupyter-nbformat' 'python-pytest' 'python-traitlets' 'jupyter-server' 'python-requests' 'python-qtpy' 'python-jupyter-core' 'python-qdarkstyle' 'python-qstylizer' 'python-psutil' 'python-tornado' j'upyter-notebook' 'python' 'python-jupyter-client')
optdepends=()
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/8c/d0/776da6c0f1f5b3902674e47e1e4addc7803cdde61389dd7bb4210a983df9/${_pypi_package//-/_}-${pkgver}.tar.gz")
sha256sums=('c9a5ceb96077cc87f820df55fd03cab7ad31ab691387a0ca76f0e117d7cd04cc')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
