# Maintainer: Ainola
# Contributor: Felix Berkenkamp

pkgname=creeper-world
pkgver=0632
pkgrel=1
pkgdesc="Imagine an enemy that is everywhere and moves like a giant, organic mass across the map."
arch=('any')
url="http://knucklecracker.com/creeperworld/cw.php"
license=('custom')
depends=('adobe-air-sdk')
makedepends=('unzip')
source=(http://knucklecracker.com/creeperworld/dd_webb/CreeperWorld-${pkgver}.exe
	    creeper-world.desktop
        creeper-world.sh)
noextract=(CreeperWorld-${pkgver}.exe)
install="$pkgname".install
sha256sums=('6ddfcaa307e36d8761049177de1dbd6c95acc7536c4ff9b2412687e3367e6afc'
            'ec5f8b5de88ad3ad1291c8cbea7d2e91e3d3daca0209fc4f5e8fd283fab0a74d'
            '809a86452f621dfcb73f1b3b6ef0c2b482315d6f822e14c20ffd720199fc495e')

package() {
  cd "$srcdir"
  unzip CreeperWorld-${pkgver}.exe
  unzip CreeperWorld-${pkgver}.air

  mkdir -p "$pkgdir"/usr/share/{"$pkgname",applications}
  mkdir -p "$pkgdir"/usr/bin

  cp -r icons Main.swf META-INF mimetype "$pkgdir/usr/share/$pkgname/"
  for size in 16 32 48 64 128; do
      mkdir -p "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/"
      ln -s "/usr/share/$pkgname/icons/cw$size.png" \
        "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/creeper-world.png"
  done

  install -Dm644 "$pkgname".desktop "${pkgdir}/usr/share/applications/"
  install -Dm755 "$pkgname".sh "$pkgdir/usr/bin/$pkgname"
}
