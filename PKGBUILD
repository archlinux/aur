# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='1'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='mopen'


pkgname="${_pypi_package}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="File opener using mimetypes and mailcap"

license=('MIT')
arch=('any')

_url_pypi='https://pypi.org/project/picon/'
_url_github='https://github.com/gokcehan/picon'
url="${_url_github}"

provides=("${_pypi_package}")
replaces=("python-${pkgname}")
conflicts=("python-${pkgname}")

depends=('bash' 'python' 'python-standard-mailcap')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
# source=("${_pypi_package}-${_upstreamver}.tar.gz::${_url_github}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('eff29763b81fdf286dda26420cb2e95fe57c251425aaadc36078887ee6404436')

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
