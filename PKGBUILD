# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor="panyanyany"
_appname="beeprint"

pkgname="python-${_appname}"
pkgver=2.4.11
pkgrel=1
pkgdesc="Make your debug printing more friendly"

_pypi_package=${pkgname##python-}
_pypi_version=${pkgver}

license=('BSD')
arch=('any')

_url_pypi="https://pypi.org/project/${_pypi_package}/"
_url_github="https://github.com/${_appauthor}/${_appname}"
url="${_url_github}"

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-uv-build')
depends=('python' 'python-urwid')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${_pypi_version}.tar.gz")
sha256sums=('a60a719c02befade140198ab94950746ec82097f795ed77f8edcc3b08296f575')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
