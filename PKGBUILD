# Maintainer: taotieren <admin@taotieren.com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname="python-fastmcp"
_name=${pkgname#python-}
pkgver=4.0.0a2
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
sha256sums=('443060a074ff652424a734686b172faea9611ee08646761c7c8edd5495ba063e')


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
