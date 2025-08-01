# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=proton-mail-bin
pkgver=1.8.1
pkgrel=1
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
  'xdg-utils'
)
optdepends=(
  'kde-cli-tools: file deletion support (kioclient5)'
  'libgnome-keyring'
  'lsb-release'
  'trash-cli: file deletion support (trash-put)'
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" 'protonmail-desktop')
source=("ProtonMail-desktop-beta-$pkgver.deb::https://proton.me/download/mail/linux/$pkgver/ProtonMail-desktop-beta.deb")
sha256sums=('43397439a3ced8e02029beed3167e44b20f2c6f15d88e9cbf42588e73da774c3')

package() {
  bsdtar -xvf data.tar.xz -C "$pkgdir/"

  # Move main files to proper directory
  install -d "$pkgdir/opt/"
  mv "$pkgdir"/usr/lib/* "$pkgdir/opt"
  rm -rf "$pkgdir/usr/lib"

  # Replace binary symlink
  ln -sf /opt/${pkgname%-bin}/Proton\ Mail\ Beta "$pkgdir/usr/bin/${pkgname%-bin}"

  # Remove lintian folder
  rm -rf "$pkgdir"/usr/share/lintian
}

