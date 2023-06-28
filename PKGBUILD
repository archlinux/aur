# Maintainer: Core_UK <dev@coredev.uk>

pkgname=cider-bin
_pkgname=cider
pkgver=1.6.1
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
sha256sums_x86_64=('9bcf27d7ae9d3dc6e5f56f7024997a506410f4a5a2d442005bde2b396f136b12')

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
 
