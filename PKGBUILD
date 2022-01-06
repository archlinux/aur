# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: DavidK <david_king@softhome.net>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Roberto Alsina <ralsina@kde.org>

pkgname=afnix
pkgver=3.6.0
pkgrel=1
pkgdesc='Multi-threaded functional programming language'
arch=('x86_64')
url='http://www.afnix.org'
license=('custom')
depends=('ncurses' 'gcc-libs')
source=("${url}/ftp/afnix-src-${pkgver}.tgz")
sha256sums=('3ca23af2fba6269400a89248aacee97d137c81ec173bed51f9875c00caf0f56e')

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
