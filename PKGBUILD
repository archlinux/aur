# Maintainer: NihilDigit <starse.nd233@gmail.com>

pkgname=waybar-ai-usage
pkgver=0.6.3
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
sha256sums=('e6b5cc41cb764d7531f23fd643f6772327237a972356ca00084fb4a7879258fa')

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
