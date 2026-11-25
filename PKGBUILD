# Maintainer: Wavecode <dev at wavecode dot hr>
# Generated for CoderView 1.0.0 by scripts/arch-pkgbuild.ts in the desktop repository.
# Build and install: makepkg -si -p <this file>
pkgname=coderview-bin
pkgver=1.0.0
pkgrel=1
_tag=v1.0.0
pkgdesc='Desktop coding assistant with private screen capture and bring-your-own-key AI'
arch=('x86_64')
url='https://coderview.app'
license=('LicenseRef-Proprietary')
depends=(
  'alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'glib2' 'glibc' 'gtk3' 'libcups' 'libgcc'
  'libsecret' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes'
  'libxkbcommon' 'libxrandr' 'mesa' 'nspr' 'nss' 'pango' 'systemd-libs' 'xdg-utils'
)
optdepends=(
  'pipewire-audio: record and play back system output audio'
  'xdg-desktop-portal-kde: screen capture and global shortcuts on KDE Plasma Wayland'
  'kwallet: remember API keys on KDE Plasma'
  'gnome-keyring: remember API keys on other desktops'
)
provides=('coderview')
conflicts=('coderview')
options=('!strip' '!debug')
source=("CoderView-${pkgver}-linux-x64.deb::https://coderview.wavecode.hr/download/${_tag}/linux-x64-deb")
sha256sums=('b253c7d41dc7c284f3d7313b483b4fb1cf48558c09fab386f737895a4c9c9459')

package() {
  bsdtar -xpf data.tar.* -C "$pkgdir" --exclude ./usr/share/doc
  # Arch kernels allow unprivileged user namespaces, so Chromium's sandbox needs no setuid helper.
  chmod 0755 "$pkgdir/opt/CoderView/chrome-sandbox"
  install -d "$pkgdir/usr/bin"
  ln -s /opt/CoderView/coderview "$pkgdir/usr/bin/coderview"
}
