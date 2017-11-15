# Maintainer: Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: DavidK <david_king@softhome.net>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Roberto Alsina <ralsina@kde.org>

pkgname=afnix
pkgver=2.8.1
pkgrel=2
pkgdesc='Multi-threaded functional programming language'
arch=('x86_64')
url='http://www.afnix.org'
license=('custom')
depends=('ncurses' 'gcc-libs' 'ncurses')
source=("$url/ftp/afnix-src-$pkgver.tgz")
sha256sums=('d6505024ce3dc1e051772b1d853197405d4f7e10d54dfcc15c73f8d82411ec72')

build() {
  cd "$pkgname-src-$pkgver"

  ./cnf/bin/afnix-setup -o --prefix="$pkgdir/usr"
  make
}

package() {
  cd "$pkgname-src-$pkgver"

  make install
  install -d "$pkgdir"/usr/share/emacs/site-lisp
  install etc/*.el -t "$pkgdir"/usr/share/emacs/site-lisp
  install -D doc/xml/eul/eul.xml "$pkgdir"/usr/share/licenses/afnix/LICENSE
}
