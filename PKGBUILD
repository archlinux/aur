pkgname=linpal
pkgver=0.5_fixed
pkgrel=1
pkgdesc="This software is a Linux based client for various Palace servers."
arch=(i686 x86_64)
url="http://sourceforge.net/projects/linpal"
license=("GPL")
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-${pkgver//_/-}.tar.bz2"
"missing-declarations.patch"
"$pkgname.desktop")
depends=(libglade curl openssl gtkmm)
md5sums=('faee16137da59a03dad3aba6e0a50f73'
         'b9719a895e02b70fc06cf168afd89147'
         '2a36cccc1e09f609dbad6c745599498b')

build() {
  cd "$srcdir/$pkgname-${pkgver%_*}"
  patch -i ../missing-declarations.patch
  make
}


package() {
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/icons/"
	install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  cd "$srcdir/$pkgname-${pkgver%_*}"
  install -Dm755 $pkgname "$pkgdir/usr/share/$pkgname/$pkgname"
  install -m644 default.png "$pkgdir/usr/share/$pkgname/"
  install -m644 trans.png "$pkgdir/usr/share/$pkgname/"
  install -m644 world.svg "$pkgdir/usr/share/$pkgname/"
  install -m644 world48.png "$pkgdir/usr/share/$pkgname/"
  install -m644 $pkgname.glade "$pkgdir/usr/share/$pkgname/"
  cp -rf {colors,faces} "$pkgdir/usr/share/$pkgname"
  ln -s /usr/share/$pkgname/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  ln -s /usr/share/$pkgname/world.svg "$pkgdir/usr/share/icons/$pkgname.svg"
}
