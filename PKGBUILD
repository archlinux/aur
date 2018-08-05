# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: DavidK <david_king@softhome.net>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Roberto Alsina <ralsina@kde.org>

pkgname=afnix
pkgver=2.8.2
pkgrel=1
pkgdesc='Multi-threaded functional programming language'
arch=('x86_64')
url='http://www.afnix.org'
license=('custom')
depends=('ncurses' 'gcc-libs')
source=("${url}/ftp/afnix-src-${pkgver}.tgz")
sha256sums=('95d9cec042b6803ca4ce08508998c7dcd7a06e713666b99555e4d52b194a6f6e')

build() {
  cd "${pkgname}-src-${pkgver}"

  sed -i 's/-Werror//' cnf/mak/afnix-gcc8.mak
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
