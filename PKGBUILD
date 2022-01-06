# Maintainer: robot5x <alex at robot5x dot com>

pkgname=holochain-launcher
pkgver=0.3.7
pkgrel=1
pkgdesc="A cross-platform executable that launches a local Holochain conductor, and installs and opens apps"
arch=('x86_64')
url="https://github.com/holochain/launcher/releases"
license=(custom:CAL)
depends=(libappindicator-gtk3)
optdepends=()
conflicts=()
replaces=()
source=("https://github.com/holochain/launcher/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb")
noextract=("${pkgname}_${pkgver}_amd64.deb")
sha256sums=('1698ede2fc3f408220594bbcab2d392e6f3e5aeef03c7debe34c8c5918ba2d70')
package() {
  bsdtar -O -xf "${pkgname}_${pkgver}_amd64.deb" data.tar.gz | bsdtar -C "${pkgdir}" -xJf -

  chown root:root -R ../pkg/holochain-launcher/usr/bin
  chmod 755 -R ../pkg/holochain-launcher/usr/bin
  chown root:root -R ../pkg/holochain-launcher/usr/lib
  chmod 755 -R ../pkg/holochain-launcher/usr/lib
  chown root:root -R ../pkg/holochain-launcher/usr/share
  chmod 755 -R ../pkg/holochain-launcher/usr/share
  # Permissions fix
  find "${pkgdir}" -type d -exec chmod 755 {} \;
}
