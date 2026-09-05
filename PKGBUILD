# Maintainer: taotieren <admin@taotieren.com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="python-fastmcp"
_name=${pkgname#python-}
pkgver=4.0.3
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
sha256sums=('b0fc2ad48bc8d3f5ab282f0c5582ba100188f940ebd1aaf56c1d785e85990956')


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
