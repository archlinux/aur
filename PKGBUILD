# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='0.5.0'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='dirplot'


pkgname="${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="Nested treemap visualizations for directory trees and archives"

license=('MIT')
arch=('any')

_url_pypi='https://pypi.org/project/dirplot/'
_url_github='https://github.com/deeplook/dirplot'
url="${_url_github}"

provides=("${_pypi_package}")
conflicts=("python-${pkgname}")

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-hatchling')
depends=('python' 'python-py7zr' 'python-botocore' 'python-typer' 'python-paramiko' 'python-watchdog' 'python-numpy' 'python-rich' 'python-rarfile' 'python-boto3' 'python-click' 'python-libarchive-c' 'python-pillow' 'python-squarify' 'python-cmap' 'python-drawsvg')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
# source=("${_pypi_package}-${_upstreamver}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('267cb03350b416f61f696a1c600c82ff795faba58f96645e4236bbac1cd5fc2d')

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
