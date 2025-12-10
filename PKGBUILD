# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>


_upstreamver='0.7.1'
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
depends=('python' 'spyder' 'jupyter-nbformat' 'python-pytest' 'python-traitlets' 'jupyter-server' 'python-requests' 'python-qtpy' 'python-jupyter-core' 'python-qdarkstyle' 'python-qstylizer' 'python-psutil' 'python-tornado' j'upyter-notebook' 'python-jupyter-client')
optdepends=()
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
sha256sums=('f032c4b9f97d71c55296bba16f4b1e5d994771311d0b9979dac85bd1eb87af5f')


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
