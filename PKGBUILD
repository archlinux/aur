# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Co-Maintainer: alphazo <archlinux-1229 at notracking dot email>
pkgname=protonmail-desktop
_pkgver=1.0.2-beta
pkgver=${_pkgver//-/.}
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
source=("ProtonMail-desktop-${_pkgver}.deb::https://proton.me/download/mail/linux/ProtonMail-desktop-beta.deb")
sha256sums=('73ed22141a5c83eb7df37a0eb6d3e8900e6c2c6b0840522c0be19bb1563a8662')

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
