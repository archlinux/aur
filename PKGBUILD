# Maintainer: omartelo <meopedevts@proton.me>
# Rendered by .github/workflows/release.yml (0.45.0 -> tag, checksums via
# updpkgsums) and pushed to the AUR — edit this template, never the AUR copy.
pkgname=lich-bin
pkgver=0.45.0
pkgrel=1
pkgdesc="A personal harness for AI-assisted development"
arch=('x86_64')
url="https://github.com/omartelo/lich"
license=('AGPL-3.0-only')
provides=('lich')
conflicts=('lich')
# What the window links against; the same list, per format, lives in
# build/linux/nfpm/nfpm.yaml.
depends=('glibc' 'gcc-libs' 'nss' 'nspr' 'glib2' 'at-spi2-core' 'dbus' 'libcups'
         'libx11' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxrandr'
         'libxcb' 'mesa' 'expat' 'libxkbcommon' 'cairo' 'pango' 'systemd-libs'
         'alsa-lib')
install=lich-bin.install
optdepends=('zenity: native folder picker')
source=("lich-v${pkgver}-linux-amd64::${url}/releases/download/v${pkgver}/lich-v${pkgver}-linux-amd64"
        "lich-v${pkgver}-linux-amd64-shell.tar.zst::${url}/releases/download/v${pkgver}/lich-v${pkgver}-linux-amd64-shell.tar.zst"
        "lich-${pkgver}.desktop::https://raw.githubusercontent.com/omartelo/lich/v${pkgver}/build/linux/lich.desktop"
        "lich-${pkgver}.png::https://raw.githubusercontent.com/omartelo/lich/v${pkgver}/build/appicon.png")
sha256sums=('cccc64126826e313b1a5920cf4098c96bd13eb48b4ac01b1ef2c21ba82b746fe'
            'd3adb45138531213252032c6f0363f191f1499d0f2e1ec55f3006a1591196436'
            'e39c9238b56be089973c254d031be152b3d990d3bc2735d866b044833a6c1a4d'
            '1575213b7d0ac3b3c832da61c856f29a839a2a0242abd34d3ab3ea9ae8c8a306')

package() {
  install -Dm755 "lich-v${pkgver}-linux-amd64" "${pkgdir}/usr/bin/lich"
  # The window (lich's own Chromium), unpacked by makepkg into shell/, where
  # /usr/bin/lich looks for it: /usr/lib/lich/shell.
  install -d "${pkgdir}/usr/lib/lich"
  cp -a shell "${pkgdir}/usr/lib/lich/shell"
  install -Dm644 "lich-${pkgver}.desktop" "${pkgdir}/usr/share/applications/lich.desktop"
  install -Dm644 "lich-${pkgver}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/lich.png"
}
