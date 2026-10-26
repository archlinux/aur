# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=tizen-tv-mcp
_pkgcommit=38e408717cf815416bfe4d1ff73ade2a4e3f0ad0
pkgver=0.1.0
pkgrel=2
pkgdesc="MCP server bridging AI assistants to Samsung Tizen Smart TVs over SDB (dev tools, telemetry, debloating)"
arch=('any')
url="https://github.com/Twilight0/tizen-tv-mcp"
license=('MIT')
depends=('python' 'sdb-bin')
makedepends=('uv' 'python-installer')
optdepends=('tizen-cli: certificate creation and .wgt signing tools')
source=("${pkgname}-${pkgver}-${_pkgcommit}.tar.gz::https://github.com/Twilight0/tizen-tv-mcp/archive/${_pkgcommit}.tar.gz")
sha256sums=('78c1ce5e60e14e80d9d0ee5b5f2e9098acc5cb06a04d922e9cd9df7bdf2c17c4')

build() {
  cd "${pkgname}-${_pkgcommit}"
  uv build --wheel --out-dir dist/
}

package() {
  cd "${pkgname}-${_pkgcommit}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
