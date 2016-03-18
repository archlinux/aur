# Maintainer: Ainola
# Contributor: Jesse Jaara

pkgname=creeper-world2
pkgver=0244
pkgrel=2
pkgdesc="Enter the 14th millennium fighting an enemy that flows and oozes through the terrain."
arch=('any')
url="http://knucklecracker.com/creeperworld2/cw2.php"
license=('custom')
depends=('adobe-air-sdk')
makedepends=('unzip')
source=(http://knucklecracker.com/creeperworld2/patches/cw2PATCH-${pkgver}.air
        "$pkgname".desktop
        "$pkgname".sh)
install="$pkgname".install
noextract=(cw2PATCH-${pkgver}.air)

sha256sums=('6cb54ab81fbaf559fdc75fb391db71011a984aead6ed609eb3f22949aeb59c51'
            'd41081e89f409ba59662da35c1deeee39864ed858a2fb69c196e4321de3a451f'
            'b370448d704f4f547d632497899cd274756b24bfaf061d9c797d0c5e719cab4e')

package() {
  cd "${srcdir}"

  unzip cw2PATCH-${pkgver}.air

  mkdir -p "${pkgdir}"/usr/share/{"$pkgname",applications}
  cp -r icons Main.swf META-INF mimetype "${pkgdir}/usr/share/$pkgname/"
  for size in 16 32 48 64 128; do
      mkdir -p "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/"
      ln -s "/usr/share/$pkgname/icons/cw$size.png" \
        "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
  done

  install -Dm644 "$pkgname".desktop "${pkgdir}/usr/share/applications/$pkgname.desktop"
  install -Dm755 "$pkgname".sh "$pkgdir"/usr/bin/"$pkgname"
}
