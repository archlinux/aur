# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='1.15.1'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='nothing-less'
_execname=nless

pkgname="${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="A TUI paging application with enhanced support for tabular data and real-time streaming"

license=('MIT')
arch=('any')

_url_pypi='https://pypi.org/project/nothing-less/'
_url_github='https://github.com/mpryor/nothing-less'
url="${_url_github}"

provides=("${_execname}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-hatchling')
depends=('python' 'python-textual' 'python-packaging' 'python-rich' 'python-pyperclip')

# source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
source=("${_pypi_package}-${_upstreamver}.tar.gz::${_url_github}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('11c0bd216e1a313f25f624b9b9a7ed82eace609c495ae5509ced6c423ac4736c')

build() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/" || exit

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/" || exit

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
