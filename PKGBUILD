# Maintainer: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Thomas S Hatch <thatch45 at gmail dot com>
# Contributor: Sebastian Wiesner <lunaryorn googlemail com>
# Contributor: Benjamin Andresen <benny(at)klapmuetz(dot)org>
#              Sylvester Johansson <syljo361(at)gmail(dot)org>

pkgname=ocaml-ounit
_pkgname=ounit
pkgver=1.1.2
pkgrel=2
arch=('i686' 'x86_64')
license=('MIT')
pkgdesc="Unit testing framework for OCaml"
url="http://ounit.forge.ocamlcore.org"
depends=('ocaml')
makedepends=('ocaml-findlib')
options=('!strip')
source=("http://forge.ocamlcore.org/frs/download.php/886/$_pkgname-$pkgver.tar.gz")
md5sums=('14e4d8ee551004dbcc1607f438ef7d83')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure --disable-debug --prefix /usr --destdir "$pkgdir"
  make all
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  install -dm 755 "$OCAMLFIND_DESTDIR"
  make install
  install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
