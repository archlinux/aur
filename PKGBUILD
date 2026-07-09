# Maintainer: AntheaLaffy <anthealaffy@gmail.com>
pkgname=mvsep-gui-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="MVSEP GUI - Music separation desktop application (prebuilt binary)"
arch=('x86_64')
url="https://github.com/AntheaLaffy/mvsep-rs"
license=('Apache-2.0')
depends=('webkit2gtk' 'libappindicator-gtk3' 'librsvg' 'libvips')
makedepends=()
optdepends=()
conflicts=('mvsep-gui')
replaces=()
backup=()
options=()
install=
changelog=
source=("${url}/releases/download/v${pkgver}/mvsep-gui"
        "${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP' 'SKIP')

package() {
  cd "${srcdir}"
  
  install -Dm755 "mvsep-gui" "${pkgdir}/usr/bin/mvsep-gui"
  
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