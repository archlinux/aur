# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=teletype-svn
pkgver=r582
pkgrel=1
pkgdesc="Serial emulator based on tinyserial"
arch=('i686' 'x86_64')
url="http://www.clifford.at/tools.html"
license=('custom')
depends=('readline')
makedepends=('subversion')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("teletype::svn+http://svn.clifford.at/tools/trunk")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-*}"
  printf "r%s" "$(svnversion | tr -d 'A-z')"
}

prepare() {
  cd "$srcdir/${pkgname%-*}"
  sed -i -e 's/-ltermcap//g' Makefile
}

build() {
  cd "$srcdir/${pkgname%-*}"
  make teletype
}

package() {
  cd "$srcdir/${pkgname%-*}"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  sed '/-----/,/-----/d;/\*\//q' teletype.c > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -D teletype "$pkgdir/usr/bin/teletype"
}

# vim:set ts=2 sw=2 et:
