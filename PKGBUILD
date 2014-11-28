# Maintainer: Jaroslav Lichtblau <dragonlor@aur.archlinux.org>

pkgname=ggmud
pkgver=0.8.0
pkgrel=3
pkgdesc="GTK2 mud client inspired by tintin and sclient"
arch=('i686' 'x86_64')
url="http://www.ggsoft.org/ggmud/"
license=('GPL')
depends=('gtk2')
source=(http://downloads.sourceforge.net/$pkgname/GGMud-$pkgver-src.tar.gz)
sha256sums=('e7ad1e242a26f4e503c63375025c4581215afb7702b572e1fbcc99fd2b7a10bb')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  sed -i s/COMMONLIBS\ =\ -Ltt\ -ltt\ -Llua\ -llua\ -Lzlib\ -lzlib/COMMONLIBS\ =\ -Ltt\ -ltt\ -Llua\ -llua\ -Lzlib\ -lzlib\ -lm\ -ldl/ Makefile
  sed -i s/--as-needed// Makefile
  
  make CC="gcc $CFLAGS"
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  install -D -m755 "$pkgname" "${pkgdir}"/usr/bin/$pkgname
  install -D -m644 "gg_help.txt" "${pkgdir}"/usr/share/$pkgname/gg_help.txt

#.desktop + icon file
  install -D -m644 "${srcdir}"/$pkgname-$pkgver/$pkgname.desktop \
    "${pkgdir}"/usr/share/applications/$pkgname.desktop
  install -D -m644 "${srcdir}"/$pkgname-$pkgver/$pkgname.png \
    "${pkgdir}"/usr/share/pixmaps/$pkgname.png
}
