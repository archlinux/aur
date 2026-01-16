# Maintainer: Agustin Carrasco <asermax@gmail.com>

_pkgname=plannotator
pkgname=plannotator-bin
pkgver=0.6.4
pkgrel=1
pkgdesc="Interactive review and annotation tool for AI coding agent plans with visual interface"
arch=('x86_64')
url="https://github.com/backnotprop/plannotator"
license=('custom:BSL')
depends=()
provides=('plannotator')
conflicts=('plannotator' 'plannotator-git')
options=('!strip')
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64")
sha256sums_x86_64=('7040b550907697066e942c0746c11330a96b1f63ca94fb7964082092e1f12276')

latestver() {
  curl -s "https://api.github.com/repos/backnotprop/plannotator/releases/latest" | \
    grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/' || true
}

package() {
  install -Dm755 "${_pkgname}-linux-x64" "${pkgdir}/usr/bin/${_pkgname}"

  # Install slash commands for Claude Code
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/${_pkgname}/claude-command.txt" << 'EOF'
This is a placeholder for the /plannotator-review command.
The actual command will be installed by the user via the install script or manually.
EOF

  # Install license
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'EOF'
Business Source License 1.1 (BSL)
See: https://github.com/backnotprop/plannotator/blob/main/LICENSE
EOF
}
