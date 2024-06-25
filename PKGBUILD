# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Co-Maintainer: alphazo <archlinux-1229 at notracking dot email>
pkgname=protonmail-desktop
_pkgver=1.0.4-beta
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
sha256sums=('298feb8e2268cce416dbb158963cb937554ab8aae8273dd5e3ce433da1f4d496')

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
