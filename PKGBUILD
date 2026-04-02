# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>
pkgname=python-ouroboros-ai
_name=${pkgname#python-}
pkgver=0.27.0
pkgrel=1
pkgdesc="Specification-first workflow engine for AI coding agents"
arch=('any')
url="https://github.com/Q00/ouroboros"
license=('MIT')
depends=(
  'python'
  'python-aiosqlite'
  'python-cachetools'
  'python-filelock'
  'python-greenlet'
  'python-httpx'
  'python-mcp'
  'python-prompt_toolkit'
  'python-pydantic'
  'python-dotenv'
  'python-yaml'
  'python-rich'
  'python-sqlalchemy'
  'python-stamina'
  'python-structlog'
  'python-textual'
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
  'python-litellm: LiteLLM support'
  'python-streamlit: dashboard support'
  'python-plotly: dashboard support'
  'python-pandas: dashboard support'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('296c84c2b7fecf641579f2e494750d0686d73f88854193fcc9441660e437ce0b')
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
