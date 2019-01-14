# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: DavidK <david_king@softhome.net>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Roberto Alsina <ralsina@kde.org>

pkgname=afnix
pkgver=2.9.1
pkgrel=1
pkgdesc='Multi-threaded functional programming language'
arch=('x86_64')
url='http://www.afnix.org'
license=('custom')
depends=('ncurses' 'gcc-libs')
source=("${url}/ftp/afnix-src-${pkgver}.tgz")
sha256sums=('6421298db12cc40ac4965a4104b9b24b498f0d05e759d2f1fd6ba57cee90b4ce')

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
