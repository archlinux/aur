# Maintainer: Leonard de Ruijter <dev@systeemdenker.nl>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Justin Davis <jrcd 83 at gmail>

pkgname=cppo
pkgver=1.4.0
pkgrel=1
pkgdesc="The C preprocessor written in OCaml"
arch=('i686' 'x86_64')
license=('BSD')
depends=('glibc')
makedepends=('ocaml-findlib' 'ocamlbuild')
url='http://mjambon.com/cppo.html'
source=("https://github.com/mjambon/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b0ea2920b04de314c6c0e519ca5694d042246637169cb0db95773620d46d14eb')
build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p "${pkgdir}/usr/bin" "$pkgdir$(ocamlfind printconf destdir)"
  export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  make install BINDIR="${pkgdir}/usr/bin"
}
