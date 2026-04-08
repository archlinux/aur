# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>
pkgname=python-ouroboros-ai
_name=${pkgname#python-}
pkgver=0.28.2
pkgrel=1
pkgdesc="Specification-first workflow engine for AI coding agents"
arch=('any')
url="https://github.com/Q00/ouroboros"
license=('MIT')
depends=(
  'python'
  'python-aiosqlite'
  'python-prompt_toolkit'
  'python-pydantic'
  'python-yaml'
  'python-rich'
  'python-sqlalchemy'
  'python-structlog'
  'python-typer'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-hatchling'
  'python-hatch-vcs'
)
optdepends=(
  'python-anthropic: Claude integration (recommended if using Claude Code)'
  'python-claude-agent-sdk: Claude agent SDK (recommended if using Claude Code)'
  'python-mcp: MCP support'
  'python-litellm: LiteLLM support'
  'python-textual: TUI support'
  'python-streamlit: dashboard support'
  'python-plotly: dashboard support'
  'python-pandas: dashboard support'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('f2eb45c24f5f90f97dba9077b1e68a5e90fa5f4f88fde2bdbbccb1ca2b4c2da5')
install=${pkgname}.install

build() {
  cd "${_name//-/_}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name//-/_}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
