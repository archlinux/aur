# Maintainer: Arzet Ro (arzeth0@gmail.com)

pkgname=python-mcp-proxy
_pkgname="${pkgname#python-}"
_pkgname="${_pkgname//-/_}"
pkgver=0.12.0
pkgrel=1
pkgdesc="A bridge between Streamable HTTP / SSE and stdio MCP transports"
arch=('any')
url="https://github.com/sparfenyuk/mcp-proxy"
license=('MIT')
depends=('python' 'python-mcp' 'python-httpx-auth' 'uvicorn')
makedepends=('python-distribute' 'python-wheel' 'python-build' 'python-installer')
source=(https://files.pythonhosted.org/packages/source/m/mcp-proxy/mcp_proxy-$pkgver.tar.gz)
sha384sums=('89f5f98b29aafd77f320f76a2f305d8788718e35f78ab29b73ee34a28ded1942a84c26c4969b15db83f0536daab17e40')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python -m build --wheel --no-isolation
}

# untested, therefore commented:
#check() {
#  local pytest_options=(
#    -vv
#  )
#  cd "${srcdir}"/${_name}-${pkgver}
#  python -m venv --system-site-packages test-env
#  test-env/bin/python -m installer dist/*.whl
#  test-env/bin/python -m pytest "${pytest_options[@]}" tests
#}


package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
