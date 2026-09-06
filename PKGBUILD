# Maintainer: Fgaoxing <fgaoxing0206@163.com>
pkgname=axolotl-launcher-bin
pkgver=1.9.5
pkgrel=1
pkgdesc="A free, cross-platform Minecraft launcher built on the Modrinth ecosystem"
arch=('x86_64' 'aarch64')
url="https://github.com/Mystic-Stars/Axolotl"
license=('GPL-3.0-only')
depends=('webkit2gtk-4.1' 'gtk3' 'libnotify')
conflicts=('axolotl-launcher')
provides=("axolotl-launcher=${pkgver}")
source=(
  "red.ghs.axolotl.xml"
  "axolotl-launcher.desktop"
)
sha256sums=(
  "a3c7ac4b8489dff5a8e558780765648dccc99c8a65b13e6dd11777de8352da7f"
  "9a98c15cb4f1a3cec9a893be5950600b1e6fa3b6029df3a2cae88b150636520b"
)
source_x86_64=("${url}/releases/download/v${pkgver}/Axolotl.Launcher_${pkgver}_amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/Axolotl.Launcher_${pkgver}_arm64.deb")
sha256sums_x86_64=('814d9e5ac985780bfe1e46128a3d2e04f7d3aebb2500a0c63054a488e4fc6970')
sha256sums_aarch64=('78c4e5fda1fcde4d810b26561c373eb62a8ac9f1319b90e6ee94ef4b7b737008')
package() {
  cd "${srcdir}"

  local _arch_name
  if [ "${CARCH}" = "x86_64" ]; then
    _arch_name="amd64"
  elif [ "${CARCH}" = "aarch64" ]; then
    _arch_name="arm64"
  fi

  local _deb="Axolotl.Launcher_${pkgver}_${_arch_name}.deb"

  bsdtar -xf "${_deb}" -C "${srcdir}" data.tar.gz
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"

  # [PATCH]
  install -Dm644 "axolotl-launcher.desktop" "$pkgdir/usr/share/applications/axolotl-launcher.desktop"
  install -Dm644 "red.ghs.axolotl.xml" "$pkgdir/usr/share/mime/packages/red.ghs.axolotl.xml"
  mv "$pkgdir/usr/bin/Axolotl Launcher" "$pkgdir/usr/bin/axolotl-launcher"
  mv "$pkgdir/usr/share/icons/hicolor/128x128/apps/Axolotl Launcher.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/red.ghs.axolotl.png"
  mv "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/Axolotl Launcher.png" "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/red.ghs.axolotl.png"
}
