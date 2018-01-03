# Maintainer:  Eric Bailey <nerflad@gmail.com>
# Contributor: Marek Kubica <marek@xivilization.net>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Thomas S Hatch <thatch45 at gmail dot com>
# Contributor: Sebastian Wiesner <lunaryorn googlemail com>
# Contributor: Benjamin Andresen <benny(at)klapmuetz(dot)org>
# Contributor: Sylvester Johansson <syljo361(at)gmail(dot)org>

pkgname=ocaml-ounit
_pkgname=ounit
pkgver=2.0.6
pkgrel=1
arch=('i686' 'x86_64')
license=('MIT')
pkgdesc="Unit testing framework for OCaml"
url="http://ounit.forge.ocamlcore.org"
depends=('ocaml')
makedepends=('ocaml-findlib' 'ocamlbuild')
options=('!strip')
source=("http://forge.ocamlcore.org/frs/download.php/1722/$_pkgname-$pkgver.tar.gz")
sha512sums=('466ec1f691a81e0abd93f698c7328e6db4fa2d617d8f5262d9f18b57ede3d389a3ee122ed7bccc8dff20600826fbbae1d17dd88d7c1329562798792fae54417d')

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
