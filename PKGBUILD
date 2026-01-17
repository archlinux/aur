# Maintainer: NihilDigit <starse.nd233@gmail.com>

pkgname=waybar-ai-usage
pkgver=0.1.6
pkgrel=1
pkgdesc='Monitor Claude Code and OpenAI Codex CLI usage in Waybar'
arch=('any')
url='https://github.com/NihilDigit/waybar-ai-usage'
license=('MIT')
install=waybar-ai-usage.install
depends=(
  'python'
  'python-browser-cookie3'
  'python-curl-cffi-git'
  'libcurl-impersonate'
  'python-json-five'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("waybar-ai-usage-${pkgver}.tar.gz::https://api.github.com/repos/NihilDigit/waybar-ai-usage/tarball/refs/tags/v${pkgver}")
sha256sums=('9552b84fcad4ef871b51c6d0bda4ae8bb31397209cf91072690e9ff0559708ed')

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
