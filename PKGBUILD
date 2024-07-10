# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=proton-mail-bin
_pkgver=1.0.5
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Proton official desktop application for Proton Mail and Proton Calendar"
arch=('x86_64')
url="https://proton.me"
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'gtk3'
  'gvfs'
  'libdrm'
  'libnotify'
  'nss'
)
optdepends=(
  'kde-cli-tools: file deletion support (kioclient5)'
  'pipewire: WebRTC desktop sharing under Wayland'
  'trash-cli: file deletion support (trash-put)'
  'xdg-utils: open URLs with desktop’s default (xdg-email, xdg-open)'
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" 'protonmail-desktop')
source=("https://github.com/ProtonMail/inbox-desktop/releases/download/$pkgver/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('127e6f9131d8b7037a18c81bb72873b0faa49ce3d13bd2a54ea65f6c115a2054')

package() {
  bsdtar -xvf data.tar.xz -C "$pkgdir/"

  # Move main files to proper directory
  install -d "$pkgdir/opt/"
  mv "$pkgdir"/usr/lib/* "$pkgdir/opt"

  # Replace binary symlink
  ln -sf /opt/${pkgname%-bin}/Proton\ Mail\ Beta "$pkgdir/usr/bin/${pkgname%-bin}"

  # Remove unneeded Electron license & lintian folder
  rm -rf "$pkgdir"/usr/share/{doc,lintian}
}

