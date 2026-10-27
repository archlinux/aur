# Maintainer: An Nguyen <an@linux.com>

pkgname=opencode-desktop-launcher
pkgver=1.0.0
pkgrel=1
pkgdesc='Launcher and desktop integration for the self-updating OpenCode AppImage'
arch=('x86_64')
url='https://opencode.ai'
license=('0BSD' 'MIT')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'bash'
  'cairo'
  'coreutils'
  'curl'
  'dbus'
  'desktop-file-utils'
  'expat'
  'fuse2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'jq'
  'libcups'
  'libgcc'
  'libsecret'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'ripgrep'
  'systemd-libs'
  'util-linux'
  'xdg-utils'
  'zlib'
)
optdepends=('git: Git repositories and worktrees')
provides=('opencode-desktop')
conflicts=('opencode-desktop' 'opencode-desktop-bin' 'opencode-desktop-appimage')

# Pin the official icon and its license. The application itself is downloaded
# and checksum-verified by the launcher on first run, outside pacman's files.
_assets_commit=74f8d4860f49c563909e6b039b0cc8b454ebce72
_icon="opencode-desktop-icon-${_assets_commit}.png"
source=(
  "${_icon}::https://raw.githubusercontent.com/anomalyco/opencode/${_assets_commit}/packages/desktop/icons/prod/128x128@2x.png"
  "LICENSE-opencode::https://raw.githubusercontent.com/anomalyco/opencode/${_assets_commit}/LICENSE"
  'opencode-desktop'
  'ai.opencode.desktop.desktop'
  'LICENSE'
  'README.md'
)
sha256sums=(
  '37e3eb8046e0bffdd1f45b18badf63866334e1604810cf449f6b2f0985c8f0cd'
  '625f0f619133f89bbbb2abe37369613dfa1885eba1e50d02170deb62bb42cb6b'
  '86c8cc16177b41f78f394dbb31c62fb1f8eddfd3ac874ee5eff8f48862e844fb'
  '9af76270d9beb9932c298a67c0897e1564e83f1a9a794446de1789784c8e4351'
  '44d6076d051b070961df2ec0b255522bd75ef9fbf111f5d75d86fe567d9d364d'
  '986eb84019d8b90be46f4c3cf3bee08e6f682ab0e770cc6f57a53b51c5dec7ba'
)

package() {
  install -Dm755 "${srcdir}/opencode-desktop" \
    "${pkgdir}/usr/bin/opencode-desktop"
  install -Dm644 "${srcdir}/ai.opencode.desktop.desktop" \
    "${pkgdir}/usr/share/applications/ai.opencode.desktop.desktop"
  install -Dm644 "${srcdir}/${_icon}" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/ai.opencode.desktop.png"
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/LICENSE-opencode" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-opencode"
  install -Dm644 "${srcdir}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
