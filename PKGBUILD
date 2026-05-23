# Maintainer: Cyole <i@cyole.me>

pkgname=pebble-bin
pkgver=0.0.9
pkgrel=1
pkgdesc="Local-first desktop email client built with Tauri"
arch=("x86_64")
url="https://github.com/QingJ01/Pebble"
license=("AGPL-3.0-only")
depends=(
  "dbus"
  "gtk3"
  "hicolor-icon-theme"
  "libayatana-appindicator"
  "webkit2gtk-4.1"
)
optdepends=(
  "gnome-keyring: credential storage backend on GNOME-like desktops"
  "kwallet: credential storage backend on KDE Plasma"
)
provides=("pebble")
conflicts=("pebble")
options=("!strip")

_appimage="Pebble_${pkgver}_amd64.AppImage"

source=(
  "${_appimage}::${url}/releases/download/v${pkgver}/${_appimage}"
  "pebble-bin.sh"
  "pebble.desktop"
  "pebble.png::${url}/raw/v${pkgver}/src-tauri/icons/icon.png"
  "LICENSE::${url}/raw/v${pkgver}/LICENSE"
)
sha256sums=(
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
)
sha256sums[0]=1ea1cdcc9fa4ba1fe2de6f66fdfa7902e5eea48696445dc2f9da888ee895c4e0
sha256sums[1]=2b1160e0656b1f61b4c88e84e040af8f2f1100f81845ec5d8ffeb04ea8544ae6
sha256sums[2]=3cbe399effb8a4e2c3ed81e755d658a1c91bf4acde14a62da080fcd68759e531
sha256sums[3]=3190ee5ee94568f0fe7adb73aaa01b9423a89536d0004308cc61b137b0db9e7c
sha256sums[4]=0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0

package() {
  rm -rf "${srcdir}/squashfs-root"
  chmod +x "${srcdir}/${_appimage}"
  cd "${srcdir}"
  "./${_appimage}" --appimage-extract usr/bin/pebble >/dev/null

  install -Dm755 "${srcdir}/squashfs-root/usr/bin/pebble" "${pkgdir}/opt/${pkgname}/pebble"
  install -Dm755 "${srcdir}/pebble-bin.sh" "${pkgdir}/usr/bin/pebble"
  install -Dm644 "${srcdir}/pebble.desktop" "${pkgdir}/usr/share/applications/pebble.desktop"
  install -Dm644 "${srcdir}/pebble.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/pebble.png"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
