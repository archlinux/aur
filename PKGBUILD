# Contributor: damir <damir@archlinux.org>
# Maintainer: Beej Jorgensen <beej@beej.us>

pkgname=gtklife
pkgver=5.2
pkgrel=1
pkgdesc="Fast, featureful, open-source Conway's Life program for *nix"
arch=("i686" "x86_64")
depends=('gtk2')
url="http://ironphoenix.org/tril/gtklife/"
license=("GPL")
source=(
  "http://ironphoenix.org/gtklife/$pkgname-$pkgver.tar.gz"
  "${pkgname}.desktop"
)
sha1sums=('4ec6035794d18cb20552344b007888ab81cd4a3a'
          'a0edc9ebeee96b087285a863e9b168732cd59b3a')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --with-gtk2 --prefix=/usr --with-docdir=$pkgdir/usr/share/doc/${pkgname}
}

build() {
  cd $srcdir/$pkgname-$pkgver

  LDFLAGS="-lX11 -lm" make
}

package() {
  install -D -m644 ${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop

  cd $srcdir/$pkgname-$pkgver

  make prefix=$pkgdir/usr install
  install -D -m644 icon_48x48.png $pkgdir/usr/share/pixmaps/${pkgname}.png
}
