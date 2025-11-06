pkgname=clash-nyanpasu-nightly-bin
_pkgname=clash-nyanpasu
pkgver=2.0.0_alpha+8b8a9ba
_pkgver=2.0.0_alpha+8b8a9ba
pkgrel=1
pkgdesc="A Clash GUI based on tauri. Clash Nyanpasu! (∠・ω< )⌒☆​"
arch=('x86_64')
url="https://github.com/LibNyanpasu/clash-nyanpasu"
license=('GPL3')
options=(!strip)
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
conflicts=('clash-nyanpasu-git' 'clash-nyanpasu-appimage' 'clash-nyanpasu' 'clash-nyanpasu-bin')

source=("Clash.Nyanpasu_${_pkgver}_amd64_linux.deb::https://github.com/LibNyanpasu/clash-nyanpasu/releases/download/pre-release/Clash.Nyanpasu_${_pkgver}_amd64_linux.deb"
"logo.svg::https://github.com/libnyanpasu/clash-nyanpasu/raw/refs/heads/main/frontend/nyanpasu/src/assets/image/logo.svg")
sha256sums=('SKIP'
'07bdec01fa4fab2015ef605371e0760f0ba45d60fbee4795a5f56cd5638f3d23')

package() {
  tar xpf data.tar.gz -C ${pkgdir}

  # Fix icons
  install -Dm644 logo.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
  mv "${pkgdir}/usr/share/icons/hicolor/32x32/apps/Clash Nyanpasu.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${_pkgname}.png"
  mv "${pkgdir}/usr/share/icons/hicolor/128x128/apps/Clash Nyanpasu.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
  mv "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/Clash Nyanpasu.png" "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/${_pkgname}.png"
  sed -i "s/Icon=Clash Nyanpasu/Icon=${_pkgname}/" "${pkgdir}/usr/share/applications/Clash Nyanpasu.desktop"

  # Fix program name for autostart
  mv "${pkgdir}/usr/bin/Clash Nyanpasu" "${pkgdir}/usr/bin/${_pkgname}"
  mv "${pkgdir}/usr/lib/Clash Nyanpasu" "${pkgdir}/usr/lib/${_pkgname}"
  sed -i "s/Exec=\"Clash Nyanpasu\"/Exec=${_pkgname}/" "${pkgdir}/usr/share/applications/Clash Nyanpasu.desktop"
}
