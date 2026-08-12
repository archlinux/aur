# Maintainer: taotieren <admin@taotieren.com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="python-fastmcp"
_name=${pkgname#python-}
pkgver=3.4.7
pkgrel=5
pkgdesc="The fast, Pythonic way to build MCP servers and clients."
arch=('any')
url='https://github.com/PrefectHQ/fastmcp'
license=('MIT')
depends=('python' 'python-fastmcp-slim')
makedepends=(
    'git' 
    'python-setuptools' 
    'python-wheel' 
    'python-build' 
    'python-installer' 
    'python-hatchling' 
    'python-uv-dynamic-versioning'
    'python-uv-build'
)
source=(git+${url}.git#tag=v${pkgver})
sha256sums=('69345cba9f813714793c44084966f8c3a25d5a84e4470c9ffa2c05deef84fe16')


build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
