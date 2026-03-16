# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='6.14.0'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='dolphie'


pkgname="${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="Your single pane of glass for real-time analytics into MySQL/MariaDB & ProxySQL"

license=('GPL-3.0')
arch=('any')

_url_pypi='https://pypi.org/project/dolphie'
_url_github='https://github.com/charles-001/dolphie'
url="${_url_github}"

provides=("${_pypi_package}")
replaces=("python-${pkgname}")
conflicts=("python-${pkgname}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-poetry-core')
depends=('python' 'python-sqlparse' 'python-pygments' 'python-pymysql' 'python-psutil' 'python-rich' 'python-textual' 'python-plotext' 'python-zstandard' 'python-orjson' 'python-requests' 'python-loguru' 'python-packaging' 'python-charset-normalizer' 'python-myloginpath')

# source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
source=("${_pypi_package}-${_upstreamver}.tar.gz::${_url_github}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('deed795c5860b1a5fcf3e015cdfcdaad958f952144f4b5692a5734a59f73cc98')

build() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_package}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
