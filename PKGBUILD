# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Former maintainer: John Jenkins <twodopeshaggy@gmail.com>
# Contributor: Mateusz Loskot <mateusz@loskot.net>

pkgname=colormake-git
pkgver=0.9.20140503.r19.g93dd19b
pkgrel=4
pkgdesc="Colorize the output of make"
arch=('any')
url="https://github.com/pagekite/Colormake"
license=('GPL-2.0-or-later')
depends=('bash' 'perl')
makedepends=('git')
provides=("colormake=$pkgver")
conflicts=('colormake')
source=("git+https://github.com/pagekite/Colormake.git")
sha256sums=('SKIP')


prepare() {
  cd "Colormake"

  # adjust scripts to colormake.pl path
  sed -i 's#colormake.pl#/usr/share/colormake/colormake.pl#g' "colormake"
}

pkgver() {
  cd "Colormake"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "Colormake"

  install -dm755 "$pkgdir/usr/bin"
  cp -r {clmake,clmake-short,colormake,colormake-short} "$pkgdir/usr/bin"

  install -Dm755 "colormake.pl" -t "$pkgdir/usr/share/colormake"
  install -Dm644 "colormake.1" -t "$pkgdir/usr/share/man/man1"
  install -Dm644 {AUTHORS,BUGS,ChangeLog,README.md} -t "$pkgdir/usr/share/doc/colormake"
}
