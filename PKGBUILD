# Maintainer: Jose Riha <jose1711 [at] gmail (dot) com>

pkgname=kmcaster
pkgver=1.1.0
pkgrel=3
pkgdesc="On-screen display (OSD) for keyboard and mouse events"
arch=('any')
url="https://github.com/flathub/com.whitemagicsoftware.kmcaster"
license=('GPL')
depends=('archlinux-java-run')
source=("${pkgname}_${pkgver}.jar"::"https://github.com/flathub/com.whitemagicsoftware.kmcaster/releases/download/${pkgver}/kmcaster.jar"
        "kmcaster.sh"
        "$pkgname-$pkgver.desktop::https://raw.githubusercontent.com/flathub/com.whitemagicsoftware.kmcaster/${pkgver}/com.whitemagicsoftware.kmcaster.desktop"
        "$pkgname-$pkgver.svg::https://raw.githubusercontent.com/flathub/com.whitemagicsoftware.kmcaster/${pkgver}/com.whitemagicsoftware.kmcaster.svg")
noextract=("${pkgname}_$pkgver.jar")

prepare() {
  sed -e 's|/app/bin/run.sh|kmcaster|' \
      -e 's|^Icon=.*|Icon=kmcaster|' \
      -e 's|^Categories=.*|Categories=Utility;Accessibility;Java;|' \
      "$pkgname-$pkgver.desktop" > "$pkgname.desktop"
}

package() {
  install -Dm644 ${pkgname}_$pkgver.jar "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm755 kmcaster.sh "$pkgdir/usr/bin/kmcaster"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "$pkgname-$pkgver.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
}
md5sums=('c3204fe1c0a4bdc43eb8969e88401c53'
         'c89ecb10db8a6c447a956e5f4872a8bf'
         '20a1c4fe5fe619aad7ec23e192444966'
         '208da87ca1ddafe9ada242b11c25e18d')
