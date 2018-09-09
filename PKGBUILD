# Maintainer: Ainola
# Contributor: Felix Berkenkamp

pkgname=creeper-world
pkgver=0632
pkgrel=2
pkgdesc="Imagine an enemy that is everywhere and moves like a giant, organic mass."
arch=('any')
url="http://knucklecracker.com/creeperworld/cw.php"
license=('custom')
depends=('adobe-air-sdk')
makedepends=('unzip' 'gendesk')
source=("http://knucklecracker.com/creeperworld/dd_webb/CreeperWorld-${pkgver}.exe"
        "creeper-world.sh")
noextract=("CreeperWorld-${pkgver}.exe")
sha256sums=('6ddfcaa307e36d8761049177de1dbd6c95acc7536c4ff9b2412687e3367e6afc'
            '809a86452f621dfcb73f1b3b6ef0c2b482315d6f822e14c20ffd720199fc495e')

prepare() {
    gendesk -n ../PKGBUILD
    unzip -o "CreeperWorld-${pkgver}.exe"
    unzip -o "CreeperWorld-${pkgver}.air"
}

package() {
    install -Dm644 {Main.swf,mimetype} -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 META-INF/AIR/{application.xml,hash} -t "$pkgdir/usr/share/$pkgname/META-INF/AIR/"
    install -Dm644 META-INF/signatures.xml -t "$pkgdir/usr/share/$pkgname/META-INF/"
    for size in 16 32 48 64 128; do
        install -Dm644 "icons/cw$size.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
    done

    install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
