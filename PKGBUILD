# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='0.2.1'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='file-primitives'

pkgname="python-${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="File primitives for Python"
arch=('any')
url='https://pypi.org/project/file-primitives/'
license=('MIT')
depends=('python')
optdepends=()
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
sha256sums=('8f70e58dfbbbe2618d4645f1aaf6d5e7d49f68136d86486312b0a88275bbcde6')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${pkgver}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
