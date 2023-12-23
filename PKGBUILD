# Contributor: damir <damir@archlinux.org>
# Maintainer: Beej Jorgensen <beej@beej.us>

pkgname=gtklife
pkgver=5.3
pkgrel=1
pkgdesc="Fast, featureful, open-source Conway's Life program for *nix"
arch=("i686" "x86_64")
depends=('gtk2')
url="https://homeforaday.org/gtklife/"
license=("GPL")
source=(
  "https://homeforaday.org/gtklife/$pkgname-$pkgver.tar.gz"
  "${pkgname}.desktop"
)

sha1sums=('8fec9c3c84adead4a3dc28dbecd7cd29f4c52bc3'
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
