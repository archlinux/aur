# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=vacuumtube-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="YouTube Leanback (TV UI) in Electron, with a built-in adblocker (upstream binary)"
arch=('x86_64')
url="https://github.com/shy1132/VacuumTube"
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib' 'libnotify' 'libxss' 'libxtst' 'xdg-utils'
         'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator-gtk3: tray icon support')
provides=('vacuumtube')
conflicts=('vacuumtube')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.deb::https://github.com/shy1132/VacuumTube/releases/download/v${pkgver}/VacuumTube-amd64.deb")
noextract=("${pkgname}-${pkgver}.deb")
sha256sums=('32f9024b2138ee3effc346bb3a842cb91ed1845abda4eb6be17c3b55e22e4adc')

package() {
  bsdtar -xOf "$srcdir/${pkgname}-${pkgver}.deb" 'data.tar.*' \
    | bsdtar -xpf - -C "$pkgdir" --exclude './usr/share/doc' ./opt ./usr
  install -d "$pkgdir/usr/bin"
  ln -s /opt/VacuumTube/vacuumtube "$pkgdir/usr/bin/vacuumtube"
}
