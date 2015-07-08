# Maintainer: OS Hazard  <oshazard+aur@gmail.com>
pkgname=sandforce-updater
pkgver=1.3
pkgrel=3
pkgdesc="Mushkin SSD Firmware Update Tool with GUI (QT)"
arch=('i686' 'x86_64')
_arch=$(uname -m)
url="http://www.sandforce.com/index.php?id=182"
license=('unknown')
depends=('qt4' 'libpng' 'freetype2' 'libsm' 'libice' 'libxrender' 'fontconfig' 'libxext' 'libx11')
makedepends=('gzip')
optdepends=('chronos-firmware: Mushkin SSD firmware')
install=$pkgname.install
source=('https://github.com/oshazard/aur-includes/raw/master/sandforce-updater/includes.tar.gz')
md5sums=('55327a4158fa44ca5b734b81dc427b82')

package() {
  cd "$srcdir/mkn-updater"

  # Install binary
  if [ ${_arch} = "i686" ]; then
    install -Dm755 "Mushkin_FieldUpdater_v${pkgver}_FC14-32Bit" "${pkgdir}/usr/bin/sandforce-updater"
  elif [ ${_arch} = "x86_64" ]; then
    install -Dm755 "Mushkin_FieldUpdater_v${pkgver}_FC12-64Bit" "${pkgdir}/usr/bin/sandforce-updater"
  fi

  # Install pixmap and .desktop file
  install -Dm644 "mushkin_drive.png" "${pkgdir}/usr/share/pixmaps/mushkin_drive.png"
  install -Dm644 "sandforce-updater.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install documentation
  install -Dm644 Readme.txt "${pkgdir}/usr/share/doc/${pkgname}/README"
}
