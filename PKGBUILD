# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Sander Zuidema <s.zuidema at bazix dot nl>

pkgname=gluon-scenebuilder
pkgver=8.4.0
pkgrel=1
pkgdesc="Open-source drag & drop UI design tool for JavaFX (Java 8) by Gluon (binary)"
arch=('any')
url="https://gluonhq.com/products/scene-builder/"
license=('BSD')
depends=('java-environment>=8' 'java-openjfx')
conflicts=('javafx-scenebuilder')
source=("http://download.gluonhq.com/scenebuilder/$pkgver/scenebuilder-$pkgver-all.jar"
        "$pkgname.sh"
        "$pkgname.desktop")
noextract=("scenebuilder-$pkgver-all.jar")
sha256sums=('851d1dc74c82acf7262eebb195a7caad282d5680ae3f2bd19da42b62cec93b4a'
            'be575929e72b20f8cbeef6118d13b02783f72206053339a9fcbae21bd7f4b933'
            '546a550cc5d4e1314a625a6071afbb8936bb4b9f8b7380a1641be32a5366f72c')

package() {
  bsdcpio --extract --make-directories "LICENSE" "com/oracle/javafx/scenebuilder/app/about/scenebuilder-logo.png" < "scenebuilder-$pkgver-all.jar"

  cd "$srcdir"
  install -Dm 0755 "scenebuilder-$pkgver-all.jar" "$pkgdir/opt/$pkgname/$pkgname.jar"
  install -Dm 0755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm 644 "com/oracle/javafx/scenebuilder/app/about/scenebuilder-logo.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
