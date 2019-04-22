# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Former maintainer: John Jenkins <twodopeshaggy@gmail.com>
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Juergen Graefe <jg72@gmx.de>

pkgname=colormake
pkgver=0.9.20140503
pkgrel=1
pkgdesc="Colorize the output of make"
arch=('any')
url="http://bre.klaki.net/programs/colormake/"
license=('GPL2')
depends=('perl' 'bash')
source=("https://github.com/pagekite/Colormake/archive/$pkgver.tar.gz")
sha256sums=('a3f9fae9a455ac96be1cce0371b28bda33a9af73b06fa8e4329aa2f693d68d22')


prepare() {
  cd "Colormake-$pkgver"

  # adjust scripts to colormake.pl path
  sed -i 's#colormake.pl#/usr/share/colormake/colormake.pl#g' "colormake"
}

package() {
  cd "Colormake-$pkgver"

  # executables
  install -dm755 "$pkgdir/usr/bin"
  cp -r {clmake,clmake-short,colormake,colormake-short} "$pkgdir/usr/bin"

  install -Dm755 "colormake.pl" "$pkgdir/usr/share/colormake/colormake.pl"

  # man page
  install -Dm644 "colormake.1" "$pkgdir/usr/share/man/man1/colormake.1"

  # documentation
  install -dm755 "$pkgdir/usr/share/doc/colormake"
  install -m644 \
    AUTHORS \
    BUGS \
    ChangeLog \
    README \
    "$pkgdir/usr/share/doc/colormake"
}
