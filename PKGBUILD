# Maintainer: TDY <tdy@archlinux.info>

pkgname=ourico
pkgver=0.1.7
pkgrel=1
pkgdesc="A lightweight EWMH taskbar, originally designed for echinus"
arch=('i686' 'x86_64')
url="http://freecode.com/projects/ourico"
license=('MIT')
depends=('libxft')
conflicts=('ourico-hg')
install=ourico.install
source=(http://plhk.ru/static/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('6b8af8bf5afc7b9b9f13500c25b19db4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/\(CFLAGS \)= -Os/\1+= -g/; s/\(LDFLAGS \)= -s/\1+= -g/' config.mk
  sed -i 's+usr/local/share/examples+etc/xdg+' $pkgname.1
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 ouricorc "$pkgdir/etc/xdg/$pkgname/ouricorc"
  install -Dm644 $pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
