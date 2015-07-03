# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Leonard de Ruijter <leonard@aur.archlinux.org>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Magnus Therning <magnus@therning.org>

pkgname=ocaml-pcre
pkgver=7.1.5
pkgrel=1
pkgdesc="Perl compatible regular expressions for OCaml"
arch=('i686' 'x86_64')
url="http://mmottl.github.io/pcre-ocaml"
license=('LGPL')
depends=('pcre>=4.5')
makedepends=('ocaml-findlib')
replaces=('pcre-ocaml')
conflicts=('pcre-ocaml')
options=('!strip' 'staticlibs')
source=("https://github.com/mmottl/pcre-ocaml/releases/download/v$pkgver/pcre-ocaml-$pkgver.tar.gz")
md5sums=('28e40ad63fe2d568aa47ff460d3f9d3a')

build() {
  cd "$srcdir/pcre-ocaml-$pkgver"

  ./configure --disable-debug --prefix /usr --destdir "$pkgdir"
  make all
}

package() {
  cd "$srcdir/pcre-ocaml-$pkgver"
  export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  install -dm 755 "$OCAMLFIND_DESTDIR/stublibs"
  make install
  install -Dm 644 COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
