# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: DavidK <david_king@softhome.net>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Roberto Alsina <ralsina@kde.org>

pkgname=afnix
pkgver=2.9.2
pkgrel=1
pkgdesc='Multi-threaded functional programming language'
arch=('x86_64')
url='http://www.afnix.org'
license=('custom')
depends=('ncurses' 'gcc-libs')
source=("${url}/ftp/afnix-src-${pkgver}.tgz")
sha256sums=('c222bea3b2c9a69c9881b64df7390153432a146d74da3ff7f32c2b5aaaceb191')

build() {
  cd "${pkgname}-src-${pkgver}"

  ./cnf/bin/afnix-setup -o --prefix="${pkgdir}/usr"
  make
}

package() {
  cd "${pkgname}-src-${pkgver}"

  make install
  install -d "${pkgdir}"/usr/share/emacs/site-lisp
  install etc/*.el -t "${pkgdir}"/usr/share/emacs/site-lisp
  install -D doc/xml/eul/eul.xml "${pkgdir}"/usr/share/licenses/afnix/LICENSE
}
