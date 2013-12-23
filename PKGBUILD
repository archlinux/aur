# Maintainer: Marek Kubica <marek@xivilization.net>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Thomas S Hatch <thatch45 at gmail dot com>
# Contributor: Sebastian Wiesner <lunaryorn googlemail com>
# Contributor: Benjamin Andresen <benny(at)klapmuetz(dot)org>
#              Sylvester Johansson <syljo361(at)gmail(dot)org>

pkgname=ocaml-ounit
_pkgname=ounit
pkgver=2.0.0
pkgrel=1
arch=('i686' 'x86_64')
license=('MIT')
pkgdesc="Unit testing framework for OCaml"
url="http://ounit.forge.ocamlcore.org"
depends=('ocaml')
makedepends=('ocaml-findlib')
options=('!strip')
source=("http://forge.ocamlcore.org/frs/download.php/1258/$_pkgname-$pkgver.tar.gz")
sha512sums=('e12c8fb534ef88de7a83a34e5a578060a90abfce601d8532408412a56e843f69b89cfd6ce69bd7c5519e9a04e306d46339e9b8f13975727a3458afe20cd776d0')

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
