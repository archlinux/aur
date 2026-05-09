# Maintainer: Haleclipse <Haleclipse@users.noreply.github.com>

pkgname=codex-desktop-patched-bin
pkgver=26.506.21252
pkgrel=1
pkgdesc="Unofficial Codex Desktop build with third-party API/key and fast mode support"
arch=('x86_64' 'aarch64')
url="https://github.com/Haleclipse/CodexDesktop-Rebuild"
license=('Apache-2.0')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'gcc-libs'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libdrm'
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
)
optdepends=(
  'libnotify: desktop notifications'
  'libsecret: keyring integration'
  'xdg-utils: open external URLs and files'
)
provides=('codex-desktop')
conflicts=('codex-desktop' 'codex-desktop-bin')
options=('!strip')

source_x86_64=("${pkgname}-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver}/codex-${pkgver}-1.x86_64.rpm")
source_aarch64=("${pkgname}-${pkgver}-aarch64.rpm::${url}/releases/download/v${pkgver}/codex-${pkgver}-1.arm64.rpm")
sha256sums_x86_64=('9edc8fd9d655d1998370ce0c2afa38364194b19d996f8cdd05706226df677424')
sha256sums_aarch64=('c632277b9da0d9bb908bda731b0587cff1c64be5f8663a865522d1cad071c517')

package() {
  cp -a "${srcdir}/usr" "${pkgdir}/"

  rm -f "${pkgdir}/usr/bin/codex"
  ln -s ../lib/codex/Codex "${pkgdir}/usr/bin/codex-desktop"

  sed -i 's/^Exec=codex /Exec=codex-desktop /' "${pkgdir}/usr/share/applications/codex.desktop"
}
