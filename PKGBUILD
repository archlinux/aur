pkgname=kangentic-bin
_pkgname=kangentic
pkgver=0.35.0
pkgrel=1
pkgdesc="Desktop Kanban board for orchestrating AI coding agents"
arch=('x86_64')
url="https://github.com/Kangentic/kangentic"
license=('AGPL-3.0-only')
depends=('nss' 'gtk3' 'at-spi2-core' 'mesa' 'alsa-lib' 'libdrm' 'libxshmfence' 'hicolor-icon-theme')
optdepends=('libappindicator-gtk3: tray/status indicator support')
provides=('kangentic')
conflicts=('kangentic')
source=("https://github.com/Kangentic/kangentic/releases/download/v${pkgver}/kangentic_${pkgver}_amd64.deb")
sha256sums=('e685b78ee26d755619df20b310d5ce01ebdf080a3f1b7c845951ddaee6613e1f')
noextract=("kangentic_0.35.0_amd64.deb")

package() {
  bsdtar -xOf "${srcdir}/kangentic_${pkgver}_amd64.deb" data.tar.xz | bsdtar -xJf - -C "${pkgdir}"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/Kangentic/kangentic "${pkgdir}/usr/bin/kangentic"

  rm -f "${pkgdir}/usr/share/applications/kangentic.desktop"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/kangentic-bin.desktop" <<EOF
[Desktop Entry]
Name=Kangentic
Comment=Desktop Kanban board for orchestrating AI coding agents
Exec=kangentic %U
Terminal=false
Type=Application
Icon=kangentic
StartupWMClass=Kangentic
Categories=Development;
Keywords=AI;Kanban;Coding;Agents;
EOF
}
