pkgname=happier-cli-bin
pkgver=0.2.17
pkgrel=1
pkgdesc='Mobile and web companion for Claude Code, Codex, and other coding agents'
arch=('x86_64' 'aarch64')
url='https://github.com/happier-dev/happier'
license=('MIT')
depends=('glibc' 'gcc-libs' 'procps-ng')
optdepends=(
  'git: Git integration and worktrees'
  'tmux: attachable terminal sessions using tmux'
  'xdg-utils: open authentication links in a browser'
)
provides=("happier-cli=${pkgver}")
conflicts=('happier-cli')
# Stripping a Bun executable can remove its embedded application payload.
options=('!strip' '!debug')

_commit=a2c45c86804b24e60ac0b76146a3ef36dfcaa15b
_release="${url}/releases/download/cli-v${pkgver}"
source=("happier-cli-${pkgver}-LICENSE::https://raw.githubusercontent.com/happier-dev/happier/${_commit}/LICENCE")
source_x86_64=("${_release}/happier-v${pkgver}-linux-x64.tar.gz")
source_aarch64=("${_release}/happier-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('e251d0448ef3ce023c20ebac9b90a7d8642b1434825838247d6e457668eb3e00')
sha256sums_x86_64=('969328ed5296119d18e3ca48839e0baafb5d05d1ed7047afacfbac064fd8cbc4')
sha256sums_aarch64=('80e3110dc55a2a22f0cca6d26903715b67581eb5509be4e4a403b5898214bb44')

package() {
  local platform
  case "${CARCH}" in
    x86_64) platform=x64 ;;
    aarch64) platform=arm64 ;;
  esac

  install -dm755 "${pkgdir}/opt/happier-cli" "${pkgdir}/usr/bin"
  cp -a "${srcdir}/happier-v${pkgver}-linux-${platform}/." \
    "${pkgdir}/opt/happier-cli/"
  ln -s /opt/happier-cli/happier "${pkgdir}/usr/bin/happier"
  install -Dm644 "${srcdir}/happier-cli-${pkgver}-LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
