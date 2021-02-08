# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=eudic
pkgver=12.5.0
_date=2021-02-06
pkgrel=1
pkgdesc="Eudic, a proprietary dictionary software for linux"
arch=('x86_64')
url="https://www.eudic.net/v4/en/app/eudic"
license=('unknown')
depends=('gtk3'
         'libnotify'
         'nss'
         'libxss'
         'libxtst'
         'xdg-utils'
         'at-spi2-core'
         'util-linux-libs'
         'libappindicator-gtk3'
         'libsecret')
options=('!strip')
source=("${pkgname}-${pkgver}.deb::https://www.eudic.net/download/${pkgname}.deb?v=${_date}")
sha256sums=('20a2780110aa4024c3dd002415c6cc45b9ba61b209c8745baf2f2f861772b111')

prepare() {
  mkdir -p build

  tar -xf data.tar.xz -C build
}

package() {
  install -dm755 ${pkgdir}/usr/share

  cp -pvr build/usr/share/* ${pkgdir}/usr/share/ 

  # executable 
  install -Dm755 ${pkgdir}/usr/share/eusoft/AppRun ${pkgdir}/usr/bin/${pkgname}

  # desktop enrty
  sed -i "s|/usr/share/eusoft/AppRun|${pkgname}|g" ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
# vim: ts=2 sw=2 et:
