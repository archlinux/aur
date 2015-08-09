# Contributor: SaThaRiel <sathariel74[at]gmail[dot]com>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=hellband
pkgver=0.8.7
pkgrel=4
pkgdesc="Dante's Inferno Angband. Uses a 'realm' based magic system like Zangband, but with many new features."
arch=('i686' 'x86_64')
url="http://hellband.net"
license=('GPL2' 'custom')
depends=('ncurses' 'libx11' 'libxaw')
source=(http://download.hellband.net/hb087src.zip)
md5sums=('dc39712c236bf749c4ad25eb0b58e914')
 
build() {
  cd "$srcdir/hb087src/src"
  cp makefile.org Makefile
  mv config.h config.h.org
  sed -e 's/\#\ define\ DEFAULT_PATH\ \"\.\/lib\/\"/\#\ define\ DEFAULT_PATH\ \"\/usr\/lib\/hellband\/\"/' config.h.org > config.h
  make
}

package() {
  cd "$srcdir/hb087src/src"
  install -d "$pkgdir/usr/lib/$pkgname"
  cd ..
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  cp -rp lib/* "$pkgdir/usr/lib/$pkgname/"
  chown -R root:games "$pkgdir/usr/lib/$pkgname/"
  chmod 775 "$pkgdir/usr/lib/$pkgname/apex"
  chmod 775 "$pkgdir/usr/lib/$pkgname/save"
  chmod 775 "$pkgdir/usr/lib/$pkgname/data"
  find $pkgdir/usr/lib/$pkgname/ -name delete.me -exec rm {} \;
  find $pkgdir/usr/lib/$pkgname/ -name 'Makefile*' -exec rm {} \;
  install -Dm644 COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
