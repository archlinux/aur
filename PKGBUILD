# Maintainer: Patrick Oberherr <patrick@oberherr.at>

pkgname=waybar-ai-usage-oauth
pkgver=0.5.0
pkgrel=1
pkgdesc='Monitor Claude Code and Codex CLI usage in Waybar (OAuth-based)'
arch=('any')
url='https://github.com/poberherr/waybar-ai-usage-oauth'
license=('MIT')
install=waybar-ai-usage-oauth.install
depends=(
  'python'
  'python-requests'
  'python-json-five'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
conflicts=('waybar-ai-usage')
provides=('waybar-ai-usage')
source=("waybar-ai-usage-oauth-${pkgver}.tar.gz::https://api.github.com/repos/poberherr/waybar-ai-usage-oauth/tarball/refs/tags/v${pkgver}")
sha256sums=('SKIP')

_srcdir() {
  find "${srcdir}" -maxdepth 1 -type d -name "poberherr-waybar-ai-usage-oauth-*" | head -n 1
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
