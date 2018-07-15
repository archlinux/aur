# Contributor: Juan Diego Tascon
# Maintainer : Marcos Heredia <chelqo at gmail dot com>

pkgname=tzclock
pkgver=3.1.7
pkgrel=1
pkgdesc="Cairo clock to display the time around the world"
arch=('i686' 'x86_64')
url="http://tzclock.org/"
license=("GPL")
depends=('gtk3' 'libnotify')
makedepends=('wget')
conflicts=("$pkgname-gtk2")
source=("https://theknight.co.uk/releases/source/$pkgname-$pkgver.tar.bz2")
md5sums=('700f1b1c4bb8f20226a91d3acaa784d9')
DLAGENTS=('https::/usr/bin/wget -O %o %u')

build() {
  cd $srcdir/$pkgname-$pkgver/
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver/
  make DESTDIR=${pkgdir} install || return 1

  install -dm755 $pkgdir/usr/share/licenses/$pkgname/
  install -Dpm644 COPYING $pkgdir/usr/share/licenses/$pkgname/

  install -dm755 $pkgdir/usr/share/doc/$pkgname/
  install -Dpm644 AUTHORS INSTALL tzclock.spec debian/control $pkgdir/usr/share/doc/$pkgname/

  echo "Comment[es]=Mostrar la hora alrededor del mundo" >>$pkgdir/usr/share/applications/tzclock.desktop
}
