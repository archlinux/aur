# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>
pkgname=python-claude-agent-sdk
_name=${pkgname#python-}
pkgver=0.2.155
pkgrel=1
pkgdesc="Python SDK for Claude Code"
arch=('any')
url="https://github.com/anthropics/claude-agent-sdk-python"
license=('MIT')
depends=(
  'claude-code>=2.1.257'
  'python'
  'python-anyio'
  'python-jsonschema'
  'python-mcp'
  'python-sniffio'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-hatchling'
)
optdepends=(
  'python-trio: Trio async backend support'
  'python-opentelemetry-api: OpenTelemetry propagation support'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('1ca038c5d3892d1e62a764c0814e36079393bf797759a932a2c5c665deae8ba2')

build() {
  cd "${_name//-/_}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name//-/_}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
