# Maintainer: giosuel <me@giosuel.ch>
pkgname=lituus-bin
_pkgname=lituus
pkgver=0.2.0
pkgrel=1
pkgdesc='Settings for Hyprland: network, Bluetooth, sound and displays (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/giosuel/lituus'
license=('AGPL-3.0-or-later' 'OFL-1.1')
# The libraries for X11, Wayland and OpenGL are loaded at runtime (winit, glutin).
depends=('fontconfig' 'glibc' 'hicolor-icon-theme' 'libgcc' 'libglvnd' 'libx11' 'libxcursor' 'libxi'
         'libxkbcommon' 'libxkbcommon-x11' 'libxrandr' 'networkmanager' 'wayland')
optdepends=('networkmanager-openvpn: OpenVPN connections'
            'networkmanager-openconnect: Cisco AnyConnect connections, with web sign-in'
            'bluez: Bluetooth, and files over Bluetooth (its obexd)'
            'pipewire-pulse: the Sound page and Bluetooth audio profiles'
            'hyprland: the Displays page'
            'xdg-desktop-portal: file dialogs (certificates, VPN files, files to send)'
            'gnome-keyring: passwords kept "for me only" (or KWallet)')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!debug') # the release binary is already stripped
source_x86_64=("$url/releases/download/v$pkgver/Lituus-$pkgver-linux-x64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/Lituus-$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('59a8f59e685acb96d0c584ff9cad895535fb401a98f7a1275da04433c321a993')
sha256sums_aarch64=('1a1c29186eeaf8437bff207df4fea60d64fb20d6009622814a8e760da8c88a3f')

package() {
  case "$CARCH" in
    x86_64) cd "Lituus-$pkgver-linux-x64" ;;
    aarch64) cd "Lituus-$pkgver-linux-arm64" ;;
  esac
  install -Dm755 lituus -t "$pkgdir/usr/bin"
  install -Dm644 packaging/linux/ch.giosuel.Lituus.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 packaging/linux/ch.giosuel.Lituus.metainfo.xml -t "$pkgdir/usr/share/metainfo"
  install -Dm644 packaging/linux/icons/ch.giosuel.Lituus.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  # The fonts built into the binary.
  install -Dm644 crates/app/ui/fonts/*-LICENSE.txt -t "$pkgdir/usr/share/licenses/$_pkgname"
}
