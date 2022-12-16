# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>
# Contributor: Vladimir Cerny <blackvladimir@gmail.com>

pkgname=free42
pkgver=3.0.17
pkgrel=1
pkgdesc="A complete re-implementation of the HP-42S calculator and the HP-82240 printer"
arch=('i686' 'x86_64')
url="http://thomasokken.com/free42/"
license=('GPL')
depends=('gtk3')
source=("http://thomasokken.com/free42/upstream/$pkgname-nologo-$pkgver.tgz"
        "free42.desktop")
md5sums=('4b04025d4a86682c415d625d546f5399'
         '9e1af9bfd8ce5eb2ad107f63ea446a55')

build() {
  cd "$srcdir/$pkgname-nologo-$pkgver/gtk"

  # build both bin and dec version
  make cleaner
  make
  make clean
  make BCD_MATH=1
}

package() {
  cd "$srcdir/$pkgname-nologo-$pkgver/gtk"

  install -Dm755 free42bin "$pkgdir/usr/bin/free42bin"
  install -Dm755 free42dec "$pkgdir/usr/bin/free42dec"

  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README_GTK"
  install -Dm644 ../README "$pkgdir/usr/share/doc/$pkgname/README"

  install -Dm644 icon-48x48.xpm "$pkgdir/usr/share/icons/hicolor/48x48/apps/free42.xpm"
  install -Dm644 icon-128x128.xpm "$pkgdir/usr/share/icons/hicolor/128x128/apps/free42.xpm"

  ln -s /usr/bin/free42dec "$pkgdir/usr/bin/free42"

  cd ../skins
  for _f in Ehrling42sl.* Standard.* README.txt; do
    install -Dm644 $_f "$pkgdir/usr/share/$pkgname/skins/$_f"
  done

  install -Dm644 "$srcdir/free42.desktop" "$pkgdir/usr/share/applications/com.thomasokken.free42.desktop"
}

# vim:set ts=2 sw=2 et:
