# Maintainer: HeartsDo <heartsdo[at]vivaldi[dot]net>
# Contributor: doomlord <doomlordcs@gmail.com>
# Contributor: naka <weedeadpixels@gmail.com>
# Contributor: SlimShadyIAm me[at]slim[dot]ovh

pkgname=premid
_pkgname=PreMiD
pkgver=2.3.2
pkgrel=1
pkgdesc="Discord Rich Presence for web services"
arch=('x86_64')
url='https://premid.app'
license=('MPL2')
optdepends=('discord: Proper Rich Presence support')
conflicts=('premid-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/premid/Linux/releases/download/v${pkgver}/${_pkgname}.tar.gz")
sha512sums=('4e0920115694120c5b76898c07b77aef1e106d8599cfbc1b727791a3b5c331af96c1a0f563240e7f79576f095235aeb44eca1f386c5527210cb97effe68b0c7e')

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
