# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Juan Diego Tascon
# Contributor: Marcos Heredia <chelqo@gmail.com>

_pkgname=tzclock
pkgname=${_pkgname}-gtk2
pkgver=4.2
pkgrel=4
pkgdesc="Cairo clock to display the time around the world"
arch=('i686' 'x86_64')
url="https://theknight.co.uk/"
license=("GPL")
depends=('gtk2' 'libnotify' 'libdial' 'libgnomeui')
conflicts=("${_pkgname}")
source=("https://theknight.co.uk/releases/Source/$_pkgname-$pkgver.tar.bz2")
sha512sums=('ac7355cb99c63dea3a3811c89cb00519c348b7be7fbf1fa75e849521c34951cf03bde5ff357266e2f5f1e0f84950d60d7eadf6c96817588300518a98af3d0119')

build() {
  cd $srcdir/${_pkgname}-$pkgver/
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/${_pkgname}-$pkgver/
  make DESTDIR=${pkgdir} install

  install -dm755 $pkgdir/usr/share/licenses/$pkgname/
  install -Dpm644 COPYING $pkgdir/usr/share/licenses/$pkgname/

  install -dm755 $pkgdir/usr/share/doc/$pkgname/
  install -Dpm644 AUTHORS INSTALL tzclock.spec debian/control $pkgdir/usr/share/doc/$pkgname/

  echo "Comment[es]=Mostrar la hora alrededor del mundo" >>$pkgdir/usr/share/applications/TzClock.desktop
}
