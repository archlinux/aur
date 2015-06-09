# Maintainer: oliver < a t > first . in-berlin . de
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Kostas Andreadis <kmandreadis@gmail.com>
# Contributor: Thomas S Hatch <thatch45 at gmail dot com>
# Contributor: Gerad Munsch <gmunsch@unforgivendevelopment.com>
pkgname=ocaml-calendar
pkgver=2.04
pkgrel=1
pkgdesc="OCaml library managing dates and times"
arch=('i686' 'x86_64')
url="http://calendar.forge.ocamlcore.org"
license=('LGPL')
#depends=('ocaml')
makedepends=('ocaml' 'ocaml-findlib')
source=(http://forge.ocamlcore.org/frs/download.php/1481/calendar-$pkgver.tar.gz)
#       http://forge.ocamlcore.org/frs/download.php/1481/calendar-2.04.tar.gz
md5sums=('625b4f32c9ff447501868fa1c44f4f4f')
options=('!strip')
 
build() {
  cd "$srcdir/calendar-$pkgver"
  ./configure --prefix=/usr
  make all doc
}
 
package() {
  INSTALLDIR="${pkgdir}$(ocamlfind printconf destdir)"
  cd "$srcdir/calendar-$pkgver"
  mkdir -p "$INSTALLDIR"
  chmod 755 "$INSTALLDIR"
  make OCAMLFIND_DESTDIR="$INSTALLDIR" install
  install -d -m 0755 "${pkgdir}/usr/share/doc/$pkgname"
  install -t "${pkgdir}/usr/share/doc/$pkgname/" doc/*
  install -Dm 644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
