# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='2.3.0'
_upstreamver_regex='^[0-9]+\.[0-9]+\.[0-9]+$'
_source_type='pypi-releases'
_pypi_package='fts-tool'


pkgname="${_pypi_package%%-tool}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="A lightweight CLI tool and TUI application for fast local-network file transfers and communication"

license=('MIT')
arch=('any')

_url_pypi='https://pypi.org/project/fts-tool/'
_url_github='https://github.com/Terabase-Studios/fts'
url="${_url_github}"

provides=("${_pypi_package}")
replaces=("python-${pkgname}")
conflicts=("python-${pkgname}")
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
depends=('python' 'python-textual' 'python-tqdm' 'python-psutil' 'python-cryptography' 'python-filelock')

# source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${pkgver}.tar.gz")
source=("${_pypi_package}-${_upstreamver}.tar.gz::${_url_github}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4d5d55d5a485e6fdaa4effae2d053135f7f4aeb504058234e064d31c881a2cbe')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
