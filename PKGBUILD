# Contributor: damir <damir@archlinux.org>
# Maintainer: Beej Jorgensen <beej@beej.us>

pkgname=gtklife
pkgver=5.1
pkgrel=6
pkgdesc="Fast, featureful, open-source Conway's Life program for *nix"
arch=("i686" "x86_64")
depends=('gtk2')
url="http://ironphoenix.org/tril/gtklife/"
license=("GPL")
source=(
  "$url/$pkgname-$pkgver.tar.gz"
  "${pkgname}.desktop"
)
md5sums=('a92ce6e2f9c66ede050143cf95f6afcd'
         'cf032adb5287e300b6f0176950944298')

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
