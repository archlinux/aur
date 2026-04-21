# Maintainer: aquaticcalf
pkgname=spirit
pkgver=0.0.0
pkgrel=10
pkgdesc="spirit desktop (prebuilt)"
arch=('x86_64')
url="https://github.com/aquaticcalf/spirit"
license=('MIT')
source=("spirit-0.0.0-x64.tar.gz::https://github.com/aquaticcalf/spirit/releases/download/v0.0.0/spirit-0.0.0-x64.tar.gz" "icon.png::https://github.com/aquaticcalf/spirit/releases/download/v0.0.0/icon.png")
noextract=("spirit-0.0.0-x64.tar.gz")
sha256sums=('59885c007d1c622f230d24fb26a7b5673c97131af9a4b20c8b09dcc979e4b34a' 'SKIP')

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  tar -xzf "${srcdir}/spirit-0.0.0-x64.tar.gz" -C "${pkgdir}/opt/${pkgname}" --strip-components=1

  install -d "${pkgdir}/usr/bin"
  ln -sf "/opt/${pkgname}/spirit-desktop" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
  install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"

  install -d "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<DESKTOP
[Desktop Entry]
Name=spirit
Comment=spirit desktop
Exec=/usr/bin/${pkgname} --no-sandbox %U
Terminal=false
Icon=${pkgname}
Type=Application
Categories=Development;Utility;
MimeType=x-scheme-handler/spirit;
DESKTOP
}
