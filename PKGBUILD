# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=zapm
pkgver=0.8.1
pkgrel=1
pkgdesc="A science fiction roguelike, Nethack in space."
arch=("i686" "x86_64")
url="http://zapm.org/"
license=("unknown")
depends=("ncurses")
[ "$CARCH" == "x86_64" ] && depends=("lib32-ncurses")
source=("http://zapm.org/zapm-$pkgver.linux.tar.gz"
        "launcher")
md5sums=('c0f10ad593be7c22d6da336cf8de9cbc'
         'bf4b75ae17d4c95fabcda50bae47fa80')

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/share/zapm"
  sed -i 's|libpanel.so.5|libpanelw.so\x00|g' zapm
  cp -r * "$pkgdir/usr/share/zapm"
  chown -R root:games "$pkgdir/usr/share/zapm/user"
  chmod -R 775 "$pkgdir/usr/share/zapm/user"
  install -D "$srcdir/launcher" "$pkgdir/usr/bin/$pkgname"
}
