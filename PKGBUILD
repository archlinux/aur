# Maintainer: doomlord <doomlordcs@gmail.com>
# Contributor: naka <weedeadpixels@gmail.com>
# Contributor: SlimShadyIAm me[at]slim[dot]ovh

pkgname=premid
_pkgname=PreMiD
pkgver=2.2.14
pkgrel=1
pkgdesc="Discord Rich Presence for web services"
arch=('x86_64')
url='https://premid.app'
license=('MPL2')
optdepends=('discord: Proper Rich Presence support')
conflicts=('premid-git')
source=("https://github.com/${_pkgname}/Linux/releases/download/v${pkgver}/${_pkgname}.tar.gz")
sha512sums=('SKIP') # CI build

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
