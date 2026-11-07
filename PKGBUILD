# Maintainer: AntheaLaffy <anthealaffy@gmail.com>
pkgname=mvsep-gui-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="MVSEP GUI - Music separation desktop application (prebuilt binary)"
arch=('x86_64')
url="https://github.com/AntheaLaffy/mvsep-rs"
license=('Apache-2.0')
depends=('webkit2gtk' 'libappindicator-gtk3' 'librsvg' 'libvips' 'fuse2')
makedepends=()
optdepends=()
conflicts=('mvsep-gui')
replaces=('mvsep-gui')
backup=()
options=('!strip' '!debug')
install=
changelog=
source=("MVSEP_${pkgver}_amd64.AppImage::${url}/releases/download/v${pkgver}/MVSEP_${pkgver}_amd64.AppImage"
        "mvsep-rs-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0e484150976c49c968be9c14aae492156f4d0b42d791732cd82f271d9e13f314'
            '7db925cbfe6b82a7bba72da93811e5dc3f12855cef857dffb6f6b52ac273a0ec')

package() {
  cd "${srcdir}"
  
  install -Dm755 "MVSEP_${pkgver}_amd64.AppImage" "${pkgdir}/usr/bin/mvsep-gui"
  
  install -d "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/com.mvsep.app.desktop" <<EOF
[Desktop Entry]
Name=MVSEP
Comment=Music separation tool
Exec=mvsep-gui
Terminal=false
Type=Application
Icon=com.mvsep.app
Categories=AudioVideo;Audio;Utility;
Keywords=audio;separation;music;
EOF
  
  cd "mvsep-rs-${pkgver}/src-tauri/icons"
  
  install -d "${pkgdir}/usr/share/icons/hicolor/32x32/apps"
  install -Dm644 "32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/com.mvsep.app.png"
  
  install -d "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
  install -Dm644 "128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/com.mvsep.app.png"
  
  install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
  install -Dm644 "128x128@2x.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/com.mvsep.app.png"
  
  cd "${srcdir}/mvsep-rs-${pkgver}"
  
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}