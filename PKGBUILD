# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor="crftwr"
_appname="puikit"

pkgname="python-${_appname}"
pkgver=1.16.0
pkgrel=1
pkgdesc="Capability-based Python UI framework with TUI and GUI backends"

_pypi_package=${pkgname##python-}
_pypi_version=${pkgver}

license=('MIT')
arch=('any')

_url_pypi="https://pypi.org/project/${_pypi_package}/"
_url_github="https://github.com/${_appauthor}/${_appname}"
url=${_url_github}

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
depends=('python' 'python-pillow' 'python-pygments' 'python-numpy')

# source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/v${_pypi_version}.tar.gz")
sha256sums=('78d4159d01ecc05c20cd3bb712a10cbb2eb5b23d928ac45d40332fe44337b4cc')

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
