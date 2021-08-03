# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: DavidK <david_king@softhome.net>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Roberto Alsina <ralsina@kde.org>

pkgname=afnix
pkgver=3.5.0
pkgrel=1
pkgdesc='Multi-threaded functional programming language'
arch=('x86_64')
url='http://www.afnix.org'
license=('custom')
depends=('ncurses' 'gcc-libs')
source=("${url}/ftp/afnix-src-${pkgver}.tgz")
sha256sums=('1cc14063b1f75162efe225038cd0c4275ac297165bebc5e1fee0f37d73816926')

build() {
  cd "${pkgname}-src-${pkgver}"

  ./cnf/bin/afnix-setup -o --prefix="${pkgdir}/usr"
  make
}

package() {
  cd "${pkgname}-src-${pkgver}"

  make install
  install -d "${pkgdir}/usr/share/emacs/site-lisp"
  install etc/unx/*.el -t "${pkgdir}/usr/share/emacs/site-lisp"
  install -D doc/xml/eul/std-us-legal.xml "${pkgdir}/usr/share/licenses/afnix/LICENSE"
}
