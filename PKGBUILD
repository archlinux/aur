# Maintainer: NihilDigit <starse.nd233@gmail.com>

pkgname=waybar-ai-usage
pkgver=0.7.1
pkgrel=1
pkgdesc='Monitor Claude Code, OpenAI Codex CLI, and GitHub Copilot usage in Waybar'
arch=('any')
url='https://github.com/NihilDigit/waybar-ai-usage'
license=('MIT')
install=waybar-ai-usage.install
depends=(
  'python'
  'python-browser-cookie3'
  'python-curl_cffi'
  'curl-impersonate'
  'python-json-five'
  'python-sly'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("waybar-ai-usage-${pkgver}.tar.gz::https://api.github.com/repos/NihilDigit/waybar-ai-usage/tarball/refs/tags/v${pkgver}")
sha256sums=('7bf6cc46ccce94fe04949a6f0aee8d0ddbe04a164324c077ba0cfc62d17fc8c1')

_srcdir() {
  find "${srcdir}" -maxdepth 1 -type d -name "NihilDigit-waybar-ai-usage-*" | head -n 1
}

build() {
  cd "$(_srcdir)"
  python -m build --wheel --no-isolation
}

package() {
  cd "$(_srcdir)"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
