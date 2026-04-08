# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>
pkgname=python-claude-agent-sdk
_name=${pkgname#python-}
pkgver=0.1.56
pkgrel=1
pkgdesc="Python SDK for Claude Code"
arch=('any')
url="https://github.com/anthropics/claude-agent-sdk-python"
license=('MIT')
depends=(
  'python'
  'python-anyio'
  'python-mcp'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-hatchling'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('a95bc14e59f9d6c8e7fa2e6581008a3f24f10e1b57302719823f62cfb5beccdc')

build() {
  cd "${_name//-/_}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name//-/_}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
