# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>
pkgname=python-claude-agent-sdk
_name=${pkgname#python-}
pkgver=0.2.142
pkgrel=1
pkgdesc="Python SDK for Claude Code"
arch=('any')
url="https://github.com/anthropics/claude-agent-sdk-python"
license=('MIT')
depends=(
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
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('05e38a4b9bc8e4b859969de8c437f241a698581b330606a1b34ad692e1819e8c')

build() {
  cd "${_name//-/_}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name//-/_}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
