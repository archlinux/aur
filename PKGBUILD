# $Id: PKGBUILD 114959 2014-07-16 11:42:05Z almageste $
# Maintainer: Alexandre Labrosse <almageste@melix.net>
# Contributor: -

pkgname=hexedit-advanced-search
pkgver=1.2.13
pkgrel=2
pkgdesc="Hex Editor for Linux with advanced search patch from Volker Schatz"
arch=('i686' 'x86_64')
url="http://rigaux.org/hexedit.html"
license=('GPL')
depends=('ncurses')
provides=('hexedit')
conflicts=('hexedit')
source=("http://rigaux.org/hexedit-${pkgver}.src.tgz"
        "http://www.volkerschatz.com/unix/patches/hexedit-search2a.diff.gz")
md5sums=('a5af1378d028512a9cad27a5ba3e15f9'
         '519d24ad17bd87fd6f97ae14043dce89')

prepare() {
  cd "${srcdir}/hexedit"
  patch -p1 < ../hexedit-search2a.diff
}

build() {
  cd "${srcdir}/hexedit"
  CFLAGS="$CFLAGS -Wall"

  ./configure
  make
}

package() {
  cd "${srcdir}/hexedit"

  make prefix="${pkgdir}/usr" install
}
