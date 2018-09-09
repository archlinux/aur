# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=zapm
pkgver=0.8.3
_pkgver=083
pkgrel=2
pkgdesc="A science fiction roguelike, Nethack in space."
arch=("i686" "x86_64")
url="http://zapm.org/"
license=("unknown")
depends=("ncurses")
#source=("http://nethack.devnull.net/software/zapm-$_pkgver-src.tgz")
source=("https://pkgbuild.com/~kkeen/sources/zapm-$_pkgver-src.tgz")
md5sums=("4759b924a506cc0674cfb9aa2ca69866")

prepare() {
  cd $pkgname-$pkgver
  sed -i 's|  grow|  this->grow|' Util.h
  sed -i 's|-flat_namespace||' Makefile
}

build() {
  cd $pkgname-$pkgver
  # double quoting needed to make #defines happy
  make ZAPMOWNER='root:games' GAMEDIR='"/usr/share/games/zapm"' \
    DATADIR='"/usr/share/games/zapm/data"' zapm-multiuser
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" ZAPMOWNER='root:games' \
    GAMEDIR="$pkgdir/usr/share/games/zapm" \
    DATADIR="$pkgdir/usr/share/games/zapm/data" install

  install -d "$pkgdir/usr/bin/"
  ln -s /usr/share/games/zapm/zapm "$pkgdir/usr/bin/zapm"

  install -d "$pkgdir/usr/share/doc/zapm"
  cp -r docs/* "$pkgdir/usr/share/doc/zapm"
}

