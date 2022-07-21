# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

pkgname=premid-nightly
_pkgname=PreMiD
pkgver=2.3.3_1652526171
gitver=2.3.3-1652526171
pkgrel=2
pkgdesc="Discord Rich Presence for web services"
arch=('x86_64')
url='https://premid.app'
license=('MPL2')
optdepends=('discord: Proper Rich Presence support')
conflicts=('premid-git' 'premid')
source=("premid-$pkgver.tar.gz::https://github.com/premid/Linux/releases/download/v${gitver}/${_pkgname}.tar.gz")
sha512sums=('3b797c70327b5bf1fd8b632eeb8672d83a48ee8bee7eb794f7f1f73e5a463f317ad79e95e1f5d3e6044871948ebd4a90350f83faf5034d2217a90bf52f1b5fb9')

package() {
  # Package
  install -d "$pkgdir"/opt/premid
  cp -a $_pkgname/. "$pkgdir"/opt/premid

  # Icon
  install -d "${pkgdir}/usr/share/pixmaps"
  ln -s "/opt/premid/assets/appIcon.png" "${pkgdir}/usr/share/pixmaps/premid.png"

  # Desktop Entry
  install -Dm644 "${pkgdir}/opt/premid/assets/premid.desktop" -t "${pkgdir}/usr/share/applications"
  mkdir -p ${pkgdir}/usr/bin/
  ln -sf /opt/premid/premid  "${pkgdir}/usr/bin/premid"

  # Libraries
  ln -sf /usr/lib/libEGL.so "$pkgdir"/opt/premid/libEGL.so
  ln -sf /usr/lib/libGLESv2.so "$pkgdir"/opt/premid/libGLESv2.so
  ln -sf /usr/lib/libEGL.so "$pkgdir"/opt/premid/swiftshader/libEGL.so
  ln -sf /usr/lib/libGLESv2.so "$pkgdir"/opt/premid/swiftshader/libGLESv2.so
}
