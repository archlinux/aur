#Maintainer: atvknox <atvknox at gmail dot com>
#Ex-Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_upstreamver='2.4.2'
_pypi_package='fts-tool'

pkgname="${_pypi_package%%-tool}"
pkgver="${_upstreamver}"
pkgrel=1
pkgdesc="A lightweight CLI tool and TUI application for fast local-network file transfers and communication"

license=('MIT')
arch=('any')

_url_github='https://github.com/Terabase-Studios/fts'
url="${_url_github}"

provides=("${_pypi_package}")
# idk if someone would have previously installed 'python-fts' so:
replaces=("python-${pkgname}")
conflicts=("python-${pkgname}")

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
depends=('python' 'python-textual' 'python-tqdm' 'python-psutil' 'python-cryptography' 'python-filelock' 'python-pycrdt' 'python-rich')

source=("${_pypi_package}-${_upstreamver}.tar.gz::${_url_github}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c4b3e831e7bbd41d19434ef19c25aede336b9a21eaacee223be6d5ba6ab8b1c8')

build() {
    local _builddir="${srcdir}/${pkgname}-${pkgver}"
    cd "$_builddir"
    
    python -m build --wheel --no-isolation
}

package() {
    local _builddir="${srcdir}/${pkgname}-${pkgver}"
    cd "$_builddir"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
