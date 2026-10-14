# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=tizen-tv-mcp
_pkgcommit=0373bbdd5c594098b7dfff3b830bd126a94490f5
pkgver=0.1.0
pkgrel=1
pkgdesc="MCP server bridging AI assistants to Samsung Tizen Smart TVs over SDB (dev tools, telemetry, debloating)"
arch=('any')
url="https://github.com/Twilight0/tizen-tv-mcp"
license=('MIT')
depends=('python' 'sdb-bin')
makedepends=('uv' 'python-installer')
optdepends=('tizen-cli: certificate creation and .wgt signing tools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Twilight0/tizen-tv-mcp/archive/${_pkgcommit}.tar.gz")
sha256sums=('649bd846884fa1837aa102538b83069ac24af6c03784bb0ed47f663c7983d71d')

build() {
  cd "${pkgname}-${_pkgcommit}"
  uv build --wheel --out-dir dist/
}

package() {
  cd "${pkgname}-${_pkgcommit}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
