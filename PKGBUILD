# Maintainer: Benoit <archlinux@benoit.jp.net>
# Contributor: OpenSauce04 <opensauce04@gmail.com>
# Contributor: Yamada Hayao <development@fascode.net>

pkgname="jquake"
pkgver="1.8.5"
pkgrel="3"
pkgdesc="Free software that helps you monitor real-time shaking events in Japan"
arch=('x86_64')
url="https://jquake.net/en/"
license=('Apache')
depends=('java-runtime')
makedepends=('fastjar')
install="${pkgname}.install"
source=("https://fleneindre.github.io/downloads/JQuake_${pkgver}_linux.zip"
        "jquake.desktop"
        "jquake.sh")
md5sums=('2c42a9dd8d5cb3597e5dcd5986ccf370'
         'SKIP'
         'SKIP')

build() {
  # Extract app icon
  fastjar xf JQuake.jar icon.png .
}

package() {
  # Desktop and launchers
  install -m 755 -D "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -m 755 -D "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  # Install icon
  install -m 644 -D "icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  # Install licenses
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 755 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE*
  # Install main program and libraries
  install -m 755 -d "${pkgdir}/usr/share/java/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/java/${pkgname}" JQuake.jar
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/lib/${pkgname}" JQuake_lib/*.jar
  # Install sounds
  install -m 755 -d "${pkgdir}/usr/share/${pkgname}"
  cp -r sounds "${pkgdir}/usr/share/${pkgname}/"
}

