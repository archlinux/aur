# Maintainer: Agustin Carrasco <asermax@gmail.com>

pkgname=plasma-applet-claude-usage-git
_pkgname=plasma-applet-claude-usage
pkgver=r38.60b4a57
pkgrel=1
pkgdesc="A KDE Plasma 6 system tray widget that displays AI coding assistant usage statistics (Claude, GLM, Codex/OpenAI, Antigravity)"
arch=(any)
url="https://github.com/asermax/plasma-applet-claude-usage"
license=(MIT)
depends=(plasma-workspace python)
optdepends=('antigravity-cli: Antigravity quota tracking' 'claude-code: Claude usage tracking')
makedepends=(git)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Install to system-wide plasma plasmoids directory
  install -dm755 "${pkgdir}/usr/share/plasma/plasmoids/com.github.claude-usage"

  cp -r contents metadata.json "${pkgdir}/usr/share/plasma/plasmoids/com.github.claude-usage/"

  # Install license
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'EOF'
MIT License

Copyright (c) 2025 Agus

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF
}
