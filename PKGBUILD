# Maintainer: Your Name <youremail@domain.com>
pkgname=tilitin
pkgver=1.5.0
pkgrel=1
pkgdesc="Finnish accounting program"
arch=(any)
url="https://helineva.net/tilitin/"
license=('GPL3')
groups=()
depends=('java-environment' 'sqlite-jdbc')
makedepends=('ant')
install=
changelog=
source=(https://helineva.net/tilitin/tilitin-1.5.0-src.zip tilitin.desktop)
md5sums=(fe74542c93f72bb2f5fc17b56df541b8 237f58ca020a5e57c5eae8e3065bb01b)

build() {
  cd "$pkgname-$pkgver"
  ant compile
}

package() {
  mkdir -p $pkgdir/usr/share/applications
  cp tilitin.desktop $pkgdir/usr/share/applications

  cd "$pkgname-$pkgver"

  mkdir -p $pkgdir/usr/share/tilitin
  cp dist/tilitin.jar $pkgdir/usr/share/tilitin
  cp tilikarttamallit $pkgdir/usr/share/tilitin -r

  ln -s /usr/share/java/sqlite-jdbc/sqlite-jdbc.jar $pkgdir/usr/share/tilitin/sqlite-jdbc.jar

  mkdir -p $pkgdir/usr/share/icons/hicolor/24x24/apps/
  mkdir -p $pkgdir/usr/share/icons/hicolor/32x32/apps/
  mkdir -p $pkgdir/usr/share/icons/hicolor/48x48/apps/

  cp src/kirjanpito/ui/resources/tilitin-24x24.png $pkgdir/usr/share/icons/hicolor/24x24/apps/tilitin.png
  cp src/kirjanpito/ui/resources/tilitin-32x32.png $pkgdir/usr/share/icons/hicolor/32x32/apps/tilitin.png
  cp src/kirjanpito/ui/resources/tilitin-48x48.png $pkgdir/usr/share/icons/hicolor/48x48/apps/tilitin.png
}
