# Maintainer: Agustin Carrasco <asermax@gmail.com>

_pkgname=plannotator
pkgname=plannotator-bin
pkgver=0.27.1
pkgrel=1
pkgdesc="Interactive review and annotation tool for AI coding agent plans with visual interface"
arch=('x86_64')
url="https://github.com/backnotprop/plannotator"
license=('custom:BSL')
depends=()
provides=('plannotator')
conflicts=('plannotator' 'plannotator-git')
options=('!strip')
source_x86_64=("${_pkgname}-linux-x64-v${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64")
sha256sums_x86_64=('e7a3cec5676cc7f842a8fb74b71ccb98f1014fe9c3633c3cffec28d0b1815451')

latestver() {
  curl -s "https://api.github.com/repos/backnotprop/plannotator/releases/latest" | \
    grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/' || true
}

package() {
  install -Dm755 "${_pkgname}-linux-x64-v${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

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
