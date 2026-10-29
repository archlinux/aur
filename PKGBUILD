# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=vacuumtube-bin
pkgver=2.0.1
pkgrel=2
pkgdesc="YouTube Leanback (TV UI) in Electron, with a built-in adblocker (upstream binary)"
arch=('x86_64')
url="https://github.com/shy1132/VacuumTube"
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib' 'libnotify' 'libxss' 'libxtst' 'xdg-utils'
         'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator: tray icon support')
provides=('vacuumtube')
conflicts=('vacuumtube')
options=('!strip' '!debug')
# The .deb carries no licence text, so it comes from the tag.
source=("${pkgname}-${pkgver}.deb::https://github.com/shy1132/VacuumTube/releases/download/v${pkgver}/VacuumTube-amd64.deb"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/shy1132/VacuumTube/v${pkgver}/LICENSE")
noextract=("${pkgname}-${pkgver}.deb")
sha256sums=('95aefe4ed472b3148142268cb772a4655fc781a8671c8ef19967e926d28dc8ae' '298749dc21f7c3747cef0f15ce93e7d2c275a47af6f860377c310858f15e315a')

package() {
  bsdtar -xOf "$srcdir/${pkgname}-${pkgver}.deb" 'data.tar.*' \
    | bsdtar -xpf - -C "$pkgdir" --exclude './usr/share/doc' ./opt ./usr
  install -d "$pkgdir/usr/bin"
  ln -s /opt/VacuumTube/vacuumtube "$pkgdir/usr/bin/vacuumtube"
  install -Dm644 "$srcdir/LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
