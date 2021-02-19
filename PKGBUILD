# Maintainer: HeartsDo <heartsdo[at]vivaldi[dot]net>
# Contributor: doomlord <doomlordcs@gmail.com>
# Contributor: naka <weedeadpixels@gmail.com>
# Contributor: SlimShadyIAm me[at]slim[dot]ovh

pkgname=premid
_pkgname=PreMiD
pkgver=2.3.1
pkgrel=1
pkgdesc="Discord Rich Presence for web services"
arch=('x86_64')
url='https://premid.app'
license=('MPL2')
optdepends=('discord: Proper Rich Presence support')
conflicts=('premid-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/premid/Linux/releases/download/v${pkgver}/${_pkgname}.tar.gz")
sha512sums=('57b7916325d830b9cd8b096ff745b1fc70b406045bd1a5001a669bb8daba8221324c1eebe03c573fb15a6c1812748ce6161ec171f4326a142daa12ff9b1c23a0')

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
