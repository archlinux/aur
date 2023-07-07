# Maintainer: Core_UK <dev@coredev.uk>

pkgname=cider-bin
_pkgname=cider
pkgver=1.6.2
pkgrel=3
pkgdesc="Project Cider. An open-source Apple Music client built from the ground up with Vue.js and Electron. Built from deb file on GitHub releases."
arch=(x86_64)
url="https://github.com/ciderapp/${_pkgname}.git"
license=(AGPL3)
depends=(gtk3 nss alsa-lib libxcrypt-compat)
optdepends=('libnotify: Playback notifications')
provides=(${_pkgname})
conflicts=(${_pkgname})
source_x86_64=("https://github.com/ciderapp/${_pkgname}/releases/download/v${pkgver}/cider_${pkgver}_amd64.deb")
sha256sums_x86_64=('a637119a14fb085215bdf9775bc26c916c931ad1755d0fdc50f6b1d6fbe48ad6')

package() {
  # Extract package data
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
  # mv "${pkgdir}/opt/${_pkgname^}" "${pkgdir}/opt/${pkgname}" # Disabled as breaks desktop file

  # Symlink the binary
  install -d "$pkgdir/usr/bin/"
  ln -sf "/opt/${_pkgname^}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  # Echo documentation to user
  echo "To change the port that Cider uses, CIDER_PORT environment variable can be set."
}
 
