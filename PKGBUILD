# Contributor: ConnorBehan <connor.behan@gmail.com>
pkgname=gsview
pkgver=4.9
pkgrel=10
pkgdesc="A nice looking GUI for ghostscript with some extraction features"
arch=('i686' 'x86_64')
options=('!makeflags')
url="http://pages.cs.wisc.edu/~ghost/gsview/get49.htm"
license=('custom:Aladdin Free Public License')
depends=('gtk' 'ghostscript')
source=(http://fossies.org/unix/misc/ghost/ghostgum/${pkgname}-${pkgver}.tar.gz ${pkgname}.desktop)
#http://mirror.cs.wisc.edu/pub/mirrors/ghost/ghostgum/${pkgname}-${pkgver}.tar.gz
install=$pkgname.install

build() {
  cd "$srcdir"/$pkgname-$pkgver
  cp ./srcunx/unx.mak Makefile
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  # Install everything to pkg since GSView can't do make install
  install -Dm644 "$srcdir"/$pkgname-$pkgver/LICENCE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 "$srcdir"/$pkgname-$pkgver/srcunx/gsview.1 "$pkgdir"/usr/share/man/man1/gsview.1
  install -Dm755 "$srcdir"/$pkgname-$pkgver/bin/gsview "$pkgdir"/usr/bin/gsview
  install -Dm755 "$srcdir"/$pkgname-$pkgver/srcunx/gvxhelp.txt "$pkgdir"/usr/bin/gsview-help
  install -Dm644 "$srcdir"/$pkgname-$pkgver/src/printer.ini "$pkgdir"/etc/gsview/printer.ini
  install -Dm644 "$srcdir"/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 "$srcdir"/$pkgname-$pkgver/binary/gsview48.png "$pkgdir"/usr/share/pixmaps/gsview48.png
}
md5sums=('96ca9460c8bd86ef20d881554331d72f' '288ad9f7cf10136a5626b7e4c40605e2')
