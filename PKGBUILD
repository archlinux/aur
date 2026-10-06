# Maintainer: juddisjudd <juddisjudd at users dot noreply dot github dot com>
pkgname=bawkterm-bin
pkgver=0.9.0
pkgrel=1
pkgdesc='SSH, SFTP, Docker and Remote Desktop client with an encrypted vault'
arch=('x86_64')
url='https://github.com/juddisjudd/bawkterm'
license=('AGPL-3.0-only')
depends=('alsa-lib' 'at-spi2-core' 'gtk3' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'mesa' 'nss' 'util-linux-libs' 'xdg-utils')
optdepends=('freerdp: open Remote Desktop hosts'
            'gnome-keyring: remember the vault on this device'
            'kwallet: remember the vault on this device')
provides=('bawkterm')
conflicts=('bawkterm')
options=('!strip' '!debug')
source=("bawkterm-${pkgver}.tar.gz::https://github.com/juddisjudd/bawkterm/releases/download/v${pkgver}/bawkterm-${pkgver}.tar.gz")
sha256sums=('43cab00a16d4158f2c67937305c15c19d8b481edbbf57fe89037b86c0a762b77')

package() {
  install -dm755 "${pkgdir}/opt/bawkterm"
  cp -a "bawkterm-${pkgver}/." "${pkgdir}/opt/bawkterm/"
  # Chromium's setuid sandbox helper
  chmod 4755 "${pkgdir}/opt/bawkterm/chrome-sandbox"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/bawkterm/bawkterm "${pkgdir}/usr/bin/bawkterm"

  install -Dm644 "${pkgdir}/opt/bawkterm/resources/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/bawkterm.png"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/bawkterm.desktop" <<'EOF'
[Desktop Entry]
Name=bawkterm
Comment=SSH, SFTP, Docker and Remote Desktop client
Exec=/usr/bin/bawkterm %U
Icon=bawkterm
Terminal=false
Type=Application
Categories=Network;RemoteAccess;
Keywords=ssh;sftp;terminal;rdp;docker;
StartupWMClass=bawkterm
EOF
}
