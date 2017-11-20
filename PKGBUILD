# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Ivy Foster <ivy.foster@gmail.com>
# Contributor: Jeff Parent <jecxjo@sdf.lonestar.org>
# Contributor: Andy Kosela <spear@protect-ya-neck.com>
# Contributor: Lev Velykoivanenko <velykoivanenko.lev@gmail.com>

pkgname=frotz
pkgver=2.44
pkgrel=6
pkgdesc='Z-machine interpreter for interactive fiction games'
arch=('x86_64' 'i686')
url='http://frotz.sf.net/'
license=('GPL')
makedepends=('setconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DavidGriffith/frotz/archive/$pkgver.tar.gz")
sha256sums=('dbb5eb3bc95275dcb984c4bdbaea58bc1f1b085b20092ce6e86d9f0bf3ba858f')

prepare() {
  for opt in \
    PREFIX="$pkgdir/usr" \
    CONFIG_DIR="$pkgdir/etc" \
    CURSES='-lncurses -ltinfo' \
    CURSES_DEF='-DUSE_NCURSES_H' \
    MAN_PREFIX="$pkgdir/usr/share" \
    OPTS='${CFLAGS}'
  do setconf -a "$pkgname-$pkgver/Makefile" "$opt"; done
  sed '/@e/d' -i "$pkgname-$pkgver/Makefile"
}

build() {
  CFLAGS="$CFLAGS -w" make -s -C "$pkgname-$pkgver" -j $(grep -c ^processor /proc/cpuinfo)
}

package() {
  make -s -C "$pkgname-$pkgver" install
}

# vim:ts=2 sw=2 et:
