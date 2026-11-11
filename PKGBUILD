# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="crftwr"
pkgname="xefm"
pkgver=1.15.0
pkgrel=1
pkgdesc="A dual-pane file manager for the desktop and the terminal"

_pypi_package=${pkgname}
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${pkgname}/"
_url_github="https://github.com/${pkgauthor}/${pkgname}"
url=${_url_github}

provides=("${_pypi_package}")
conflicts=("python-${pkgname}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
depends=('python' 'python-pillow' 'python-botocore' 'python-boto3' 'python-truststore' 'python-libarchive-c' 'python-pyte' 'python-pygments' 'python-watchdog' 'python-puikit')

# source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dce40c3d2ebf05dce412ec7722c7e6478c745294d4ad78ab1de86bd0c12f5cf0')

build() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/" || exit

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/" || exit

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
