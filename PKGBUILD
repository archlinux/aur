# Maintainer: OpenObsidian <openobsidian@gmail.com>

pkgname=openobsidian-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Local-first knowledge management app built around Markdown, graph navigation, and optional cloud collaboration"
arch=("x86_64")
url="https://github.com/OpenObsidian/OpenObsidian"
license=("MIT")
depends=("fuse2" "gtk3" "nss" "libxss" "libxtst" "libsecret" "xdg-utils")
provides=("openobsidian")
conflicts=("openobsidian")
options=("!strip")

_appimage="OpenObsidian-${pkgver}.AppImage"

source_x86_64=(
  "${_appimage}::${url}/releases/download/v${pkgver}/${_appimage}"
  "openobsidian.png::${url}/raw/v${pkgver}/build/icon.png"
  "openobsidian.desktop"
)

# Replace SKIP values with real hashes before publishing:
# makepkg -g
sha256sums_x86_64=("SKIP" "SKIP" "SKIP")

package() {
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/openobsidian/openobsidian.AppImage"
  install -Dm644 "${srcdir}/openobsidian.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/openobsidian.png"
  install -Dm644 "${srcdir}/openobsidian.desktop" "${pkgdir}/usr/share/applications/openobsidian.desktop"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/openobsidian/openobsidian.AppImage" "${pkgdir}/usr/bin/openobsidian"
}
