# Maintainer: taotieren <admin@taotieren.com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="python-fastmcp"
_name=${pkgname#python-}
pkgver=3.4.2
pkgrel=3
pkgdesc="The fast, Pythonic way to build MCP servers and clients."
arch=('any')
url='https://github.com/jlowin/fastmcp'
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
sha256sums=('09ee73023a7c2e8a85b35db343f896df2b2f3246c7799dea620f0bfc0836d30c')


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
