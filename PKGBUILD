# Maintainer: giosuel <me@giosuel.ch>
pkgname=vinculum-bin
_pkgname=vinculum
pkgver=0.2.0
pkgrel=1
pkgdesc='Manage Wi-Fi, wired and VPN connections (NetworkManager GUI, prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/giosuel/vinculum'
license=('AGPL-3.0-or-later' 'OFL-1.1')
# The libraries for X11, Wayland and OpenGL are loaded at runtime (winit, glutin).
depends=('fontconfig' 'glibc' 'hicolor-icon-theme' 'libgcc' 'libglvnd' 'libx11' 'libxcursor' 'libxi'
         'libxkbcommon' 'libxkbcommon-x11' 'libxrandr' 'networkmanager' 'wayland')
optdepends=('networkmanager-openvpn: OpenVPN connections'
            'xdg-desktop-portal: file dialogs for certificates and VPN files'
            'gnome-keyring: passwords kept "for me only" (or KWallet)')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!debug') # the release binary is already stripped
source_x86_64=("$url/releases/download/v$pkgver/Vinculum-$pkgver-linux-x64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/Vinculum-$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('d7c8a736a2e4b6fb691f940eafc33ac79e6acb9c40d1d7b2e9908cbe784d46a1')
sha256sums_aarch64=('4af89c35f2e659361c1bd3cb6a762abfc60448eac9d8c895a5b3366140c16f2f')

package() {
  case "$CARCH" in
    x86_64) cd "Vinculum-$pkgver-linux-x64" ;;
    aarch64) cd "Vinculum-$pkgver-linux-arm64" ;;
  esac
  install -Dm755 vinculum -t "$pkgdir/usr/bin"
  install -Dm644 packaging/linux/ch.giosuel.Vinculum.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 packaging/linux/ch.giosuel.Vinculum.metainfo.xml -t "$pkgdir/usr/share/metainfo"
  install -Dm644 packaging/linux/icons/ch.giosuel.Vinculum.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  # The fonts built into the binary.
  install -Dm644 crates/app/ui/fonts/*-LICENSE.txt -t "$pkgdir/usr/share/licenses/$_pkgname"
}
