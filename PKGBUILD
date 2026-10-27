# Maintainer: Adib Hanna <adibhanna@gmail.com>
#
# Muxin (yay -S muxin-bin): written by scripts/aur.sh in
# https://github.com/LumaryLabsLLC/muxin from each release.

pkgname=muxin-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="All your machines in one app, for you and your AI agents"
arch=('x86_64' 'aarch64')
url="https://muxin.dev"
license=('Apache-2.0')
depends=('glibc' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'vulkan-icd-loader')
optdepends=('wayland: to run in a Wayland session'
            'vulkan-driver: to draw its window (Mesa or your GPU maker'"'"'s)')
provides=('muxin')
conflicts=('muxin')
options=('!strip' '!debug')
source_x86_64=("Muxin-${pkgver}-linux-x86_64.tar.gz::https://github.com/LumaryLabsLLC/muxin/releases/download/v${pkgver}/Muxin-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("Muxin-${pkgver}-linux-aarch64.tar.gz::https://github.com/LumaryLabsLLC/muxin/releases/download/v${pkgver}/Muxin-${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('f19a6dbffeb99007fe605d910029322b7e22a878ba5b7a98c27851ad446971bc')
sha256sums_aarch64=('b5383b055a4a41ca6c71cf6f7607e75020ad639643a16bcf68282a24092231f0')

package() {
  cd "${srcdir}/Muxin"

  # The app, beside the agent builds it sets up on your machines.
  install -Dm755 muxin "${pkgdir}/usr/lib/muxin/muxin"
  install -dm755 "${pkgdir}/usr/lib/muxin/agents"
  install -m755 agents/* "${pkgdir}/usr/lib/muxin/agents/"

  # The command, and its name from before (Muxen).
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /usr/lib/muxin/muxin "${pkgdir}/usr/bin/muxin"
  ln -s /usr/lib/muxin/muxin "${pkgdir}/usr/bin/muxen"

  install -Dm644 muxin.desktop "${pkgdir}/usr/share/applications/muxin.desktop"
  install -Dm644 muxin.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/muxin.png"
  install -Dm644 LICENSE NOTICE THIRD_PARTY_NOTICES.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
