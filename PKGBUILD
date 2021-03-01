# Maintainer: sigmacool
# Contributor: FabioLolix

pkgname=lanshare
pkgver=1.2.1
pkgrel=8
pkgdesc="LAN Share is a cross platform local area network file transfer application, built using Qt GUI framework."
arch=(i686 x86_64 arm armv6h armv7h aarch64)
url="https://github.com/abdularis/LAN-Share"
license=(GPL)
depends=(qt5-base)
source=("$pkgname-$pkgver.tar.gz::https://github.com/abdularis/LAN-Share/archive/$pkgver.tar.gz")
sha256sums=('c2d8edbb71c524d52defb5f11790ded241908a47c329754cd95fdd1526e4c65e')

prepare() {
  cd "$srcdir/LAN-Share-$pkgver/packaging/linux/debian"
  sed -i "/Path=.*/d" LANShare.desktop 
  sed -i "s^Exec=.*^Exec=/usr/bin/LANShare^" LANShare.desktop 
  sed -i "s/Name\[en_US\]=.*/Name\[en_US\]=LANShare/" LANShare.desktop
}

build() {
  cd "$srcdir/LAN-Share-$pkgver/src"
  qmake
  make
}

package() {
  install -Dm755 "$srcdir/LAN-Share-$pkgver"/src/LANShare "$pkgdir"/usr/bin/LANShare
  ln -s /usr/bin/LANShare "$pkgdir/usr/bin/lanshare"

  cd "$srcdir/LAN-Share-$pkgver/packaging/linux/debian"
  install -D LANShare.desktop  "$pkgdir"/usr/share/applications/LANShare.desktop
  install -D lanshare-icon.png "$pkgdir"/usr/share/pixmaps/lanshare-icon.png
}
