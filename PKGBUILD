# Maintainer: HeartsDo <heartsdo[at]vivaldi[dot]net>
# Contributor: doomlord <doomlordcs@gmail.com>
# Contributor: naka <weedeadpixels@gmail.com>
# Contributor: SlimShadyIAm me[at]slim[dot]ovh

pkgname=premid
_pkgname=PreMiD
pkgver=2.3.4
pkgrel=1
pkgdesc="Discord Rich Presence for web services"
arch=('x86_64')
url='https://premid.app'
license=('MPL2')
optdepends=('discord: Proper Rich Presence support')
conflicts=('premid-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/premid/Linux/releases/download/v${pkgver}/${_pkgname}.tar.gz")
sha512sums=('45302be27235d4ec7e6047957d2880d8c7227dd0e384a9666dff17ee4f2c18afc1806317209be5b60d13f317c4648e005f8916f4aa00812d9c09133cffb5491d')

package() {
  # Package
  install -d "$pkgdir"/opt/$pkgname
  cp -a $_pkgname/. "$pkgdir"/opt/$pkgname

  # Icon
  install -d "${pkgdir}/usr/share/pixmaps"
  ln -s "/opt/${pkgname}/assets/appIcon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # Desktop Entry
  install -Dm644 "${pkgdir}/opt/${pkgname}/assets/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  mkdir -p ${pkgdir}/usr/bin/
  ln -sf /opt/premid/premid  "${pkgdir}/usr/bin/premid"

  # Libraries
  ln -sf /usr/lib/libEGL.so "$pkgdir"/opt/$pkgname/libEGL.so
  ln -sf /usr/lib/libGLESv2.so "$pkgdir"/opt/$pkgname/libGLESv2.so
  ln -sf /usr/lib/libEGL.so "$pkgdir"/opt/$pkgname/swiftshader/libEGL.so
  ln -sf /usr/lib/libGLESv2.so "$pkgdir"/opt/$pkgname/swiftshader/libGLESv2.so
}
