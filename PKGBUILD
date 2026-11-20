# Maintainer: Irshad Ali <irshadali5@proton.me>
pkgname=siar-bin
pkgver=0.1.0_alpha.2
_pkgver_tag=v0.1.0-alpha.2
pkgrel=1
pkgdesc="Survivable Identity & Autonomous Routing: decentralized, offline-first messaging (prebuilt binaries)"
arch=('x86_64')
url="https://github.com/irshadlab/siar"
license=('AGPL-3.0-or-later' 'Apache-2.0' 'MIT')
depends=('gtk3' 'alsa-lib' 'openssl')
provides=('siar' 'siar-daemon' 'siar-desktop')
conflicts=('siar' 'siar-git')
source=(
  "https://github.com/irshadlab/siar/releases/download/${_pkgver_tag}/siar-${_pkgver_tag}-linux-x86_64.tar.gz"
  "siar.png::https://raw.githubusercontent.com/irshadlab/siar/main/assets/branding/icon.png"
)
sha256sums=(
  '703a737dabaa1f1a93328133385fc36deb02835e1c21d396e6f1366220b87eb6'
  'e414d01fee3e72ef0175153db5222338836f1c922e48d1333aef17d72b188dbd'
)

package() {
  cd "siar-${_pkgver_tag}-linux-x86_64"

  # Install binaries
  install -Dm755 siar "${pkgdir}/usr/bin/siar"
  install -Dm755 siar-daemon "${pkgdir}/usr/bin/siar-daemon"
  install -Dm755 siar-desktop "${pkgdir}/usr/bin/siar-desktop"

  # Install icon
  install -Dm644 "${srcdir}/siar.png" "${pkgdir}/usr/share/pixmaps/siar.png"
  install -Dm644 "${srcdir}/siar.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/siar.png"

  # Install desktop entry
  install -d "${pkgdir}/usr/share/applications"
  cat << 'EOF' > "${pkgdir}/usr/share/applications/siar.desktop"
[Desktop Entry]
Name=SIAR
GenericName=Decentralized Secure Messenger
Comment=Sovereign Infrastructure for Autonomous Resilience (P2P / Mesh / E2EE Messenger)
Exec=siar-desktop
Icon=siar
Terminal=false
Type=Application
Categories=Network;InstantMessaging;Chat;P2P;
StartupWMClass=siar-desktop
Keywords=chat;messaging;mesh;p2p;encrypted;e2ee;iroh;dtn;
EOF

  # Install Licenses & Documentation
  install -Dm644 LICENSE-AGPLv3 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-AGPLv3"
  install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
