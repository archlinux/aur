# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=protonmail-desktop
pkgver=1.0.0
pkgrel=1
pkgdesc="Proton official desktop application for Proton Mail and Proton Calendar"
arch=('x86_64')
url="https://proton.me"
license=('unknown')
depends=(
  'alsa-lib'
  'gtk3'
  'libnotify'
  'nss'
)
optdepends=(
  'kde-cli-tools: file deletion support (kioclient5)'
  'pipewire: WebRTC desktop sharing under Wayland'
  'trash-cli: file deletion support (trash-put)'
  'xdg-utils: open URLs with desktop’s default (xdg-email, xdg-open)'
)
source=("ProtonMail-desktop-$pkgver-beta.deb::https://proton.me/download/mail/linux/ProtonMail-desktop-beta.deb")
sha256sums=('dc5466d36130f46b8631714093048bf856de2f2688d529a90d4dc0e5e261e935')

package() {
  bsdtar -xvf data.tar.xz -C "$pkgdir/"

  # Move main files to proper directory
  install -d "$pkgdir/opt/"
  mv "$pkgdir"/usr/lib/* "$pkgdir/opt"

  # Replace binary symlink
  ln -sf /opt/proton-mail/Proton\ Mail\ Beta "$pkgdir/usr/bin/proton-mail"

  # Remove unneeded Electron license & lintian folder
  rm -rf "$pkgdir"/usr/share/{doc,lintian}
}
