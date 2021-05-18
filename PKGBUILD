# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Former maintainer: John Jenkins <twodopeshaggy@gmail.com>
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Juergen Graefe <jg72@gmx.de>

pkgname=colormake
pkgver=0.9.20140503
pkgrel=2
pkgdesc="Colorize the output of make"
arch=('any')
url="https://bre.klaki.net/programs/colormake/"
license=('GPL2')
depends=('perl' 'bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pagekite/Colormake/archive/$pkgver.tar.gz")
sha256sums=('a3f9fae9a455ac96be1cce0371b28bda33a9af73b06fa8e4329aa2f693d68d22')


prepare() {
  cd "Colormake-$pkgver"

  # adjust scripts to colormake.pl path
  sed -i 's#colormake.pl#/usr/share/colormake/colormake.pl#g' "colormake"
}

package() {
  cd "Colormake-$pkgver"

  # executables
  install -Dm755 "colormake" -t "$pkgdir/usr/bin"
  cp -r {clmake,clmake-short,colormake-short} "$pkgdir/usr/bin"

  install -Dm755 "colormake.pl" -t "$pkgdir/usr/share/colormake"

  # man page
  install -Dm644 "colormake.1" -t "$pkgdir/usr/share/man/man1"

  # documentation
  install -Dm644 {AUTHORS,BUGS,ChangeLog,README} -t "$pkgdir/usr/share/doc/colormake"
}
