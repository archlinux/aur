# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Sander Zuidema <s.zuidema at bazix dot nl>

pkgname=gluon-scenebuilder
pkgver=8.3.0
pkgrel=1
pkgdesc="Open-source drag & drop UI design tool for JavaFX by Gluon (bin)"
arch=('any')
url="https://gluonhq.com/products/scene-builder/"
license=('BSD')
depends=('java-environment>=8' 'java-openjfx')
conflicts=('javafx-scenebuilder')
source=("http://download.gluonhq.com/scenebuilder/$pkgver/scenebuilder-all-$pkgver-all.jar"
        "$pkgname.sh"
        "$pkgname.desktop")
noextract=("scenebuilder-all-$pkgver-all.jar")
sha256sums=('ce59812646d6fce13b535f2113ac2ac086284f0cf4a6c43356a690c3e6c19359'
            'be575929e72b20f8cbeef6118d13b02783f72206053339a9fcbae21bd7f4b933'
            '85012a1c560592cc0e76d762f1351758d75f6d1ac61eadb3b3b12e21319207fa')

package() {
  bsdcpio --extract --make-directories "LICENSE" "com/oracle/javafx/scenebuilder/app/about/scenebuilder-logo.png" < scenebuilder-all-$pkgver-all.jar 

  cd "$srcdir"
  install -Dm 0755 "scenebuilder-all-$pkgver-all.jar" "$pkgdir/opt/$pkgname/$pkgname.jar"
  install -Dm 0755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm 0644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm 0644 "com/oracle/javafx/scenebuilder/app/about/scenebuilder-logo.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
