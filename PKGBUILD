# Maintainer: taotieren <admin@taotieren.com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="python-fastmcp"
_name=${pkgname#python-}
pkgver=3.4.4
pkgrel=1
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
sha256sums=('d6b0cf60e03a85189750aee01a97b4fec3c7a0f325aa00082613378c43c25eeb')


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
