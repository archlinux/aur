# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor='charles-001'
_pkgname='dolphie'
pkgname="${_pkgname}"
pkgver=6.18.0
pkgrel=1
pkgdesc="Your single pane of glass for real-time analytics into MySQL/MariaDB & ProxySQL"

_pypi_package=${_pkgname}
_pypi_version=${pkgver}

license=('GPL-3.0')
arch=('any')

_url_pypi="https://pypi.org/project/${_pypi_package}"
_url_github="https://github.com/${_pkgauthor}/${_pkgname}"
url="${_url_github}"

provides=("${_pypi_package}")
replaces=("python-${pkgname}")
conflicts=("python-${pkgname}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-poetry-core')
depends=('python' 'python-sqlparse' 'python-pygments' 'python-pymysql' 'python-psutil' 'python-rich' 'python-textual' 'python-plotext' 'python-zstandard' 'python-orjson' 'python-requests' 'python-loguru' 'python-packaging' 'python-charset-normalizer' 'python-myloginpath')

# source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
source=("${_pypi_package}-${_pypi_version}.tar.gz::${_url_github}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6a97128516d0a0abc25dae4c2ade77fe15c73b0968e10132412d0cfcee151393')

build() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${_pypi_version}/"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
