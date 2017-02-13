# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=linsmith
pkgver=0.99.30
pkgrel=1
pkgdesc="A Smith Charting program, mainly designed for educational use"
arch=('i686' 'x86_64')
url="http://jcoppens.com/soft/linsmith/index.en.php"
license=('GPL')
depends=('tcl' 'libgnomeui' 'hamradio-menus')
makedepends=('intltool' 'pkg-config' 'gettext')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz"
        "$pkgname.desktop")

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  install -Dm644 doc/$pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 doc/manual.pdf "$pkgdir/usr/share/$pkgname/doc/manual.pdf"

  find "$pkgdir/usr/share/man/man1" -name *.1 -exec gzip -9 {} +

  install -Dm644 ../$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 linsmith_icon.xpm "$pkgdir/usr/share/pixmaps/$pkgname.xpm"
}
md5sums=('a07f14ca8a3c1368d7594ec177f4b5d9'
         '2d0246a85ce1aebd359c5c3cabfed7b5')
sha256sums=('76739c0cdc13f193793842ea4ddd027a27143a6672994de485b9902c32a41aa3'
            'bc74c02dbedc8c80b552e276c770e9ee3f0b231e371ea08a3e0a6921812b1938')
