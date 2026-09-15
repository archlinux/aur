# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor="PrefectHQ"
_appname="burner-redis"

pkgname="python-${_appname}"
pkgver=0.1.7
pkgrel=1
pkgdesc="An embedded, in-process Redis-compatible database"

_pypi_package=${pkgname##python-}
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${_pypi_package}/"
_url_github="https://github.com/${_appauthor}/${_appname}"
url="${_url_pypi}"

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-maturin')
depends=('glibc' 'libgcc' 'python' 'python-redis')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
# source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${_pypi_version}.tar.gz")
sha256sums=('7474ff092669fd11ef765411572cdafcc3d89b8054aef4ca0617be6d6be4c680')


build() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package//-/_}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
